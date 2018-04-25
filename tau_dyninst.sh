#TO INSTALL
#DOWNLOAD TAU AND PDTOOLKIT, UNZIP  
# go into the pdtoolkit directory
# $ ./configure
# $ make install

CPATH=$PWD
TAUPATH=/home/naookiesato/Documents/tau_standalone/tau-2.27
PDTPATH=/home/naookiesato/Documents/tau_standalone/pdtoolkit-3.25
DYNINSTPATH=/home/naookiesato/Documents/tau_standalone/build-dyninst
#DYNINSTPATH=/usr/local

export PATH=$PATH:$PDTPATH/x86_64/bin
export PATH=$PATH:$TAUPATH/x86_64/bin

#go to the tau and pdt directory

#example config with mpi and caf
cd $TAUPATH
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninstinc=$DYNINSTPATH/include -dyninstlib=$DYNINSTPATH/lib
$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH
make install -j4
TAUMAKEFILE=Makefile.tau-pdt
export TAU_MAKEFILE=$TAUPATH/x86_64/lib/$TAUMAKEFILE

cd $CPATH
