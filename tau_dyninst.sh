CPATH=$PWD
TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
TAUPATH=$TAU_STANDALONE_DIR/tau-2.27
PDTPATH=$TAU_STANDALONE_DIR/pdtoolkit-3.25

DYNINSTPATH=$TAU_STANDALONE_DIR/build-dyninst
#DYNINSTPATH=$TAU_STANDALONE_DIR/working
#BOOSTPATH=$TAU_STANDALONE_DIR/boost_1_67_0
BOOSTPATH=$TAU_STANDALONE_DIR/boost_1_61_0
#DYNINSTPATH=/usr/local
#BOOSTPATH=/usr/include

export PATH=$PATH:$PDTPATH/x86_64/bin
export PATH=$PATH:$TAUPATH/x86_64/bin

export DYNINST_ROOT=$DYNINSTPATH
export DYNINSTAPI_RT_LIB=$DYNINSTPATH/lib/libdyninstAPI_RT.so
export LD_LIBRARY_PATH=$TAUPATH/x86_64/lib:$DYNINSTPATH/lib
export LD_LIBRARY_PATH=$DYNINSTPATH/libdwarf/lib:$LD_LIBRARY_PATH

#go to the tau and pdt directory
cd $TAUPATH
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninstinc=$DYNINSTPATH/include -dyninstlib=$DYNINSTPATH/lib -boost=$BOOSTPATH 
$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH -iowrapper -mpi
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH -dwarf=$DYNINSTPATH/libdwarf
#$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -dyninst=$DYNINSTPATH -boost=$BOOSTPATH -dwarf=$DYNINSTPATH/libdwarf -iowrapper -mpi
make VERBOSE=1 -j4
make VERBOSE=1 install -j4 
TAUMAKEFILE=Makefile.tau-pdt
#TAUMAKEFILE=Makefile.tau-mpi-pdt
export TAU_MAKEFILE=$TAUPATH/x86_64/lib/$TAUMAKEFILE

cd $CPATH
