CPATH=$PWD
#download boost
BOOSTDIR=/home/naookiesato/Documents/tau_standalone/boost_1_67_0
cd $BOOSTDIR
./bootstrap.sh --prefix=boost_output
./b2 install -j4
mv boost_output/include .
mv boost_output/lib .
rmdir boost_output

#unzip dyninst
DYNINSTSRCDIR=/home/naookiesato/Documents/tau_standalone/dyninst-9.3.2
DYNINSTBUILDDIR=/home/naookiesato/Documents/tau_standalone/build-dyninst
mkdir $DYNINSTBUILDDIR
cd $DYNINSTBUILDDIR
#cmake . -DBoost_INCLUDE_DIR=/home/naookiesato/Documents/tau_standalone/boost_1_67_0
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make
make install
cd $CPATH
