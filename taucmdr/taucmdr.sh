CPATH=$PWD
INSTALLDIR=$HOME/taucmdr
TAUCMDRDIR=$HOME/Documents/taucmdr
TAUCMDRTAUDIR=$HOME/Documents/taucmdr/system/tau/tau-2.27

cd $TAUCMDRDIR
make install INSTALLDIR=$INSTALLDIR
export PATH=$PATH:$INSTALLDIR/bin
cd $CPATH
