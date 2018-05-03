CPATH=$PWD
TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
TAUPATH=$TAU_STANDALONE_DIR/tau-2.27
PDTPATH=$TAU_STANDALONE_DIR/pdtoolkit-3.25

#DYNINSTPATH=$TAU_STANDALONE_DIR/build-dyninst
DYNINSTPATH=$TAUPATH/x86_64/dyninst-9.3.2-working
#BOOSTVER=boost_1_67_0
#BOOSTVER=boost_1_61_0
#BOOSTPATH=$TAU_STANDALONE_DIR/$BOOSTVER

export PATH=$PATH:$PDTPATH/x86_64/bin
export PATH=$PATH:$TAUPATH/x86_64/bin

#these must be executed in the environment that wants to call tau_run
export DYNINSTAPI_RT_LIB=$DYNINSTPATH/lib/libdyninstAPI_RT.so
export LD_LIBRARY_PATH=$TAUPATH/x86_64/lib:$DYNINSTPATH/lib

#go to the tau and pdt directory
cd $TAUPATH
$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=download -iowrapper -mpi
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -iowrapper -mpi
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH -iowrapper -mpi
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH -dwarf=$DYNINSTPATH/lib -iowrapper -mpi
make VERBOSE=1 -j4
make VERBOSE=1 install -j4 
TAUMAKEFILE=Makefile.tau-mpi-pdt
export TAU_MAKEFILE=$TAUPATH/x86_64/lib/$TAUMAKEFILE

cd $CPATH
