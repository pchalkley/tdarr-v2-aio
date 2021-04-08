# tdarr-v2-aio
Tdarr Server and Node run from one container

After having various issues running Tdarr using the offical docker containers (server and node), I decided to build my own.  Th issues I had were mainly performance related.  The Server would consume too much CPU and would stop the WebUI from working. Limiting the CPU had no effect as the container would still max out and become unresponsive.

All I have done here is to take a base Ubuntu image (20.04) and install the following:

software-properties-common
nano
wget
unzip
handbrake-cli
ffmpeg
