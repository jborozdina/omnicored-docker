# omnicored-docker

runs Omni Core with UI (omnicore-qt) in testnet mode (typically from Windows/MacOS workstation)

###Initial requirements:

1. Docker Toolbox
2. X client (e.g. MobaXTerm)
3. VirtualBox VM parameters:
  - 4Gb memory size
  - 2 CPU
  - at least 20Gb disk storage
  
###Getting started:

1. Get Docker Machine and X client running
2. Download docker-compose.yml file, store it anywhere on your workstion
3. In the docker-compose.yml file add the value for DISPLAY variable as your X client ip; save the changes 
4. Open docker CLI on folder with the compose file and run ```docker-compose up``` command

####*NB*

Once the Docker container starts and Omni Core UI window is opened, it begins the long-timed process of syncronizing with the blockchain. It can take more then a day till it finishes to download all the transaction blocks.

The bitcoin.conf file location: /root/.bitcoin/

*TBD - make the data folder shared*

