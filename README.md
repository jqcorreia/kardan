# Kardan

_Setups the isolated development environment for the D programming language._

Kardan uses the [CoreOS](https://coreos.com/) platform as the foundation to configure the development environment for the D programming language. The resulting development Ubuntu image is built with [Docker](https://www.docker.io/) and contains the latest versions of the D compilers (dmd and ldc) the dub package manager and many helper utilities.

## Prerequisite

You must have [Vagrant](vagrantup.com) installed in your host system. See installation instructions for more details: [Install Vagrant](https://docs.vagrantup.com/v2/installation/).


## Usage

Firt of all we need to start the virtual machine with Vagrant.

    # Start the virtual machine.
    $ vagrant up

After the machine is up and running it is possible to login.

    # Login into the machine.
    $ vagrant ssh

Now you will see the welcome message from CoreOS.

    Last login: Fri Mar 21 20:56:26 UTC 2014 from 10.0.0.1 on ssh
       ______                ____  _____
      / ____/___  ________  / __ \/ ___/
     / /   / __ \/ ___/ _ \/ / / /\__ \
    / /___/ /_/ / /  /  __/ /_/ /___/ /
    \____/\____/_/   \___/\____//____/
    core@localhost ~ $

There is only one directory in your home called `shared`. This directory is shared between the virtual machine and your host OS. The next step is to setup a base containter with the D develompent toolkit.

    # Create the development image with docker.
    $ cd ~/share
    $ docker build -t denv .
    
Now you should see docker trying to obtain the base Ubuntu image. When the download is finished the system will be updated and the development tools will be installed in a newly built image.

You can check if the image was built by asking docker to list all the images:

    $ docker images
    
As the result you will see the listing of all the locally available images and among them the newly built `denv` image.

    REPOSITORY          TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
    denv                latest              28449a03cc52        About a minute ago   921.7 MB
    ...

To run an interactive session into the built container execute:

    $ docker run -t -i -v ~/share:/share:rw denv bash
    
You will be able now to use the latest versions of `dmd`, `ldc2` and `dub`.

Have fun! ;)

