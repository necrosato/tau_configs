#TO INSTALL
#DOWNLOAD TAU AND PDTOOLKIT, UNZIP  
# go into the pdtoolkit directory
# $ ./configure
# $ make install

CPATH=$PWD
TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
TAUPATH=$TAU_STANDALONE_DIR/tau-2.27
PDTPATH=$TAU_STANDALONE_DIR/pdtoolkit-3.25

export PATH=$PATH:$PDTPATH/x86_64/bin
export PATH=$PATH:$TAUPATH/x86_64/bin

#go to the tau and pdt directory

#example config with mpi and caf
cd $TAUPATH
$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -mpi -cc=mpicc -c++=mpicxx -fortran=caf
make install -j4
TAUMAKEFILE=Makefile.tau-mpi-pdt
export TAU_MAKEFILE=$TAUPATH/x86_64/lib/$TAUMAKEFILE

cd $CPATH
