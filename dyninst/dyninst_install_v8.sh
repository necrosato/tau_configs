#Make sure you run # apt-get install libiberty-dev libelf-dev first
CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
#BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_67_0
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_61_0

#BUILD DYNINST
DYNINSTTGZ=/home/naookiesato/Downloads/DyninstAPI-8.2.1.tgz
DYNINSTSRCDIR=$TAU_STANDALONE_DIR/Dyninst-8.2.1
DYNINSTBUILDDIR=$TAU_STANDALONE_DIR/build-dyninst



cd $TAU_STANDALONE_DIR

#unzip dyninst
rm -rf $DYNINSTSRCDIR
tar -zxvf $DYNINSTTGZ

#make build dir
rm -rf $DYNINSTBUILDDIR
mkdir $DYNINSTBUILDDIR

cd $DYNINSTBUILDDIR
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make -j4
make install -j4

cd $CPATH
