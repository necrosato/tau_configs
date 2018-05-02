CPATH=$PWD
INSTALLDIR=/home/naookiesato/taucmdr
TAUCMDRDIR=/home/naookiesato/Documents/taucmdr
TAUCMDRTAUDIR=/home/naookiesato/Documents/taucmdr/system/tau/tau-2.27

cd $TAUCMDRDIR
make install INSTALLDIR=$INSTALLDIR
export PATH=$PATH:$INSTALLDIR/bin
cd $CPATH
