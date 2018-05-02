#Make sure you run # apt-get install libiberty-dev libelf-dev first
CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
#BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_67_0
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_61_0
#BOOSTDIR=/usr/include

#BUILD DYNINST
DYNINSTTGZ=/home/naookiesato/Downloads/dyninst-9.3.2.tar.gz
#DYNINSTSRCDIR=$TAU_STANDALONE_DIR/dyninst-9.3.2
DYNINSTBUILDDIR=$TAU_STANDALONE_DIR/build-dyninst
#DYNINSTTGZ=/home/naookiesato/Downloads/DyninstAPI-9.0.3.tgz
#DYNINSTSRCDIR=$TAU_STANDALONE_DIR/DyninstAPI-9.0.3
DYNINSTSRCDIR=$TAU_STANDALONE_DIR/dyninst

cd $TAU_STANDALONE_DIR

##unzip dyninst
#rm -rf $DYNINSTSRCDIR
#tar -zxvf $DYNINSTTGZ

#make build dir
rm -rf $DYNINSTBUILDDIR
mkdir $DYNINSTBUILDDIR

cd $DYNINSTBUILDDIR
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make -j8
make install -j4

cd $CPATH
