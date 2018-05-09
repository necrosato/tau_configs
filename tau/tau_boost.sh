CPATH=$PWD
TAU_STANDALONE_DIR=$HOME/Documents/tau_standalone
TAUPATH=$TAU_STANDALONE_DIR/tau2
PDTPATH=$TAU_STANDALONE_DIR/pdtoolkit-3.25

export PATH=$PATH:$PDTPATH/x86_64/bin
export PATH=$PATH:$TAUPATH/x86_64/bin

#go to the tau and pdt directory
cd $TAUPATH
$TAUPATH/configure -pdt=$PDTPATH -bfd=download -unwind=download -boost=download
make VERBOSE=1 -j8
make VERBOSE=1 install
TAUMAKEFILE=Makefile.tau-pdt
export TAU_MAKEFILE=$TAUPATH/x86_64/lib/$TAUMAKEFILE

cd $CPATH
