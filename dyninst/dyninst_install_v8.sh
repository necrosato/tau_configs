#Make sure you run # apt-get install libiberty-dev libelf-dev first
CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
#BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_67_0
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_61_0


DYNINSTSRCDIR=$TAU_STANDALONE_DIR/dyninst
DYNINSTBUILDDIR=$TAU_STANDALONE_DIR/build-dyninst
DYNINSTTGZ=/home/naookiesato/Downloads/DyninstAPI-8.2.1.tgz

cd $TAU_STANDALONE_DIR
rm -rf $DYNINSTSRCDIR

#unzip dyninst
mkdir $DYNINSTSRCDIR
tar -zxvf $DYNINSTTGZ -C $DYNINSTSRCDIR --strip-components=1

#make build dir
rm -rf $DYNINSTBUILDDIR
mkdir $DYNINSTBUILDDIR

#BUILD AND INSTALL DYNINST
cd $DYNINSTBUILDDIR
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make -j8
make install

cd $CPATH
rm -rf $DYNINSTSRCDIR
