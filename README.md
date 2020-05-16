
  

# XMLTV DOCKER

A docker implementation of [xmltv](https://github.com/XMLTV/xmltv) I created to run on my Synology DS918+ (but it will probably run on any docker host). I use it to update the tv guide on my Plex server.

Follow this guide to create a xmltv docker image on your docker host. The image is used to create and RUN a temporary docker container. When the container run's it will update the xmltv output file and the container will then be trashed. Schedule the docker RUN command on your host daily to update your xmltv.xml file.

## Getting Started

These instructions will guide you to build the xmltv docker image and get the xmltv container up and running.

### Prerequisites

```
Clone the files in this Github repository to a local folder on your docker host 
(in this guide we use: /volume1/system/docker/xmltv/ on the host)
```

### Build a docker image file using the Dockerfile in this repository

**Open a SSH connection to your docker host**
```
sudo docker image build -t kibuan/xmltv /volume1/system/docker/xmltv/build
```

### Docker container Mounts and Environment variables

**Mounts (MANDATORY)**
  
| Mount | Host folder  | Example
|--|--|--|
|/root/.xmltv | 'Container work-dir' - folder to save your xmltv configuration and cache files on your docker-host | ```-v '/volume1/system/docker/xmltv/container:/root/.xmltv'```
|/opt/xml | xmltv .xml file output dir on your docker-host | ```-v '/volume1/system/docker/xmltv/container:/opt/xml'```

**Environment variables (OPTIONAL)**
|Environment variable | Description | Example
|--|--|--|
|OUTPUT_XML_FILENAME | The file name of the xmltv output .xml file (default=-grabber-.xml) | ```-e 'xmltv.xml'```
|XMLTV_GRABBER |The name of the xmltv grabber you want to use (default=tv_grab_eu_xmltvse)| ```-e 'tv_grab_dk_dr'```
|XMLTV_DAYS |The number of days you want to grab (default=7) | ```-e '3'```

### Generate xmltv configuration file

Use this step to run xmltv configuration script and generate the configuration file.

If you already have a xmltv grabber configuration file in the container 'work-dir' on your host you can skip this.

**Create and run temporary container (edit the volume mount):**

```
sudo docker container run --rm -i \
-v '/volume1/system/docker/xmltv/container:/root/.xmltv' \
kibuan/xmltv 
```

Follow the instructions in the xmltv setup guide. When the container exits you should see the .conf file in your mounted folder on the host.

### Test run (download tv data and create output xml file)

**Setup both the mounts and run the container:**

```
sudo docker container run --rm -i \
-v '/volume1/system/docker/xmltv/container:/root/.xmltv' \
-v '/volume1/system/docker/xmltv/container:/opt/xml' \
kibuan/xmltv 
```

When the container exits the .xml file should be ready in the output folder.

# Setup xmltv guide on Plex

Follow [this guide](https://support.plex.tv/articles/using-an-xmltv-guide/) to setup Plex DVR to use your local xmltv.xml file.
