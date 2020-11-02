# Unofficial PVS-Studio docker image

## How to use
```sh
git clone https://github.com/nokitakaze/docker-pvs-studio.git
```

Change file `settings/PVS-Studio.lic`, set your username and **license key**. Yes, this image doesn't work without proper license.

https://www.viva64.com/ru/pvs-studio/

Link your source code files to folder `files` and rename your main solution to `Input.sln`.

Then 
```sh
docker-compose up --build
```

Then you could get your `files/Input.plog` and read it.
