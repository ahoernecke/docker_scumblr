docker_scumblr
=====================

# Scumblr with Docker

This repo contains everything you need to deploy a basic instance of Scumblr (https://github.com/netflix/scumblr). Scumblr is a Netflix open source project that allows performing periodic searches and storing / taking actions on the identified results. 

**Please Note: Deploying this container as-is will provide a working Scumblr instance with an onboard SQLite database. This means that all data will be lost when the container terminates. See the configuration section below for additional setup information.** 

**If you just want to quickly test the application, start with the deployment section below.**

## Configuration

This section discusses required/optional configuration that can be done prior to deploying Scumblr. Configuration is broken up into the following sections:

* API Keys (required for most Search providers to work)
* Admin User (Setup admin credentials)
* Database (Use a persistent database instead of the default ephemeral SQLite db)
* SSL

### API Keys 

Scumblr requires API keys to function. These can be setup in the config/scumblr/scumblr.rb file. Templates are contained in the file. 

### Admin User

The default configuration will create the following admin user:

``admin@admin.admin:password``
  
These credentials can be set on line 2 the config/scumblr/seeds.rb file. Note: There three fields that need to be changed: email, password, and password_confirmation. Changing the line to the following would set the account email to new_email@admin.admin with a password of "new_password":

``User.create(:email=>"new_email@admin.admin", :password=>"new_password", :password_confirmation=>"new_password", :admin=>true)``

### Database 

The default database will be an onboard SQLite db. This will work for testing but will be lost if the container terminates. To configure a permanent database, setup the database.yml file in config/scumblr/database.yml. This is configured like a standard Rails database.yml file (http://edgeguides.rubyonrails.org/configuring.html#configuring-a-database).

### SSL

This docker container ships with a self-signed cert to be used for SSL. To use a custom key pair/certificate replace the server.key and server.crt files in config/nginx

## Deployment

This section includes instructions on creating deploying a container running Scumblr. 
1. Open boot2docker
2. Pull this repo from Github:
``git clone https://github.com/ahoernecke/docker_scumblr``
3. Build the docker image
``docker build -t "scumblr" . ``
4. Run the container either:
  1. Locally (from boot2docker)
``docker run -d -p 443:443 "scumblr"`` 
  2. **or** On an EC2 instance (Ubuntu 14.04 AMI)
``docker run -d -e "host=ec2-xx-xxx-xxx-xxx.compute-1.amazonaws.com" -p 80:80 -p 443:443 "scumblr"``
5. Via your server in a browser (https://<server name/ip>)
6. Login with the credentials you specfied (or the default if not changed: admin@admin.admin/password)

  

  




