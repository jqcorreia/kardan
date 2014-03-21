

DMD_DEB="http://downloads.dlang.org/releases/2014/dmd_2.065.0-0_amd64.deb"
LDC="https://github.com/ldc-developers/ldc/releases/download/v0.13.0-alpha1/ldc2-0.13.0-alpha1-linux-x86_64.tar.xz"

function init ()
{
    cd $HOME
    mkdir -p $HOME/download $HOME/bundle
}


function install_dmd ()
{
    echo "Downloading dmd deb..."
    curl -L -o $HOME/download/dmd.deb $DMD_DEB

    echo "Installing dmd package..."
    dpkg -i $HOME/download/dmd.deb

    echo "Done!"
    echo
}


function install_ldc ()
{
    echo "Downloading ldc bundle..."
    curl -L -o $HOME/download/ldc.tar.xz $LDC

    echo "Extracting the bundle..."
    tar xvf $HOME/download/ldc.tar.xz -C $HOME/bundle/

    echo "Updating the PATH..."
    export PATH=$PATH:$HOME/bundle/ldc2-0.13.0-alpha1-linux-x86_64/bin
}


function main () {
    init
    install_dmd
    install_ldc
}

main


