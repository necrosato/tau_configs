CPATH=$PWD
TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
BOOSTTGZ=/home/naookiesato/Downloads/boost_1_67_0.tar.gz
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_67_0
#unzip boost
cd $TAU_STANDALONE_DIR
rm -rf $BOOSTDIR
tar -zxvf $BOOSTTGZ
cd $BOOSTDIR
./bootstrap.sh --prefix=boost_output
./b2 install -j4
mv boost_output/include .
mv boost_output/lib .
rmdir boost_output

DYNINSTTGZ=/home/naookiesato/Downloads/dyninst-9.3.2.tar.gz
DYNINSTSRCDIR=$TAU_STANDALONE_DIR/dyninst-9.3.2
DYNINSTBUILDDIR=$TAU_STANDALONE_DIR/build-dyninst
#unzip dyninst
cd $TAU_STANDALONE_DIR
rm -rf $DYNINSTSRCDIR
tar -zxvf $DYNINSTTGZ
mkdir $DYNINSTBUILDDIR
cd $DYNINSTBUILDDIR
#cmake . -DBoost_INCLUDE_DIR=/home/naookiesato/Documents/tau_standalone/boost_1_67_0
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make
make install
cd $CPATH
