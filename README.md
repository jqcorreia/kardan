# Kardan

_Setups the isolated development environment for the D programming language._

Kardan uses the CoreOS as the foundation and configures the development environment in Ubuntu 13.04. The resulting image will contain the latest versions of the D compilers, dmd and ldc, the dub package manager and various helper utilities.


## Usage

    # Start the virtual machine.
    vagrant up


    # Login into the machine.
    vagrant ssh

After loggin in you will see the welcome message from CoreOS. There is only one directory in your home called `shared`. This directory is shared between the virtual machine and your host OS. The next step is to setup a base containter with the D develompent toolkit.
    
    # Create the development image with docker.
    cd ~/share
    docker build -t denv
    
Now you should see docker trying to obtain the base Ubuntu image. When the download is finished the system will be updated and the development tools will be installed.







