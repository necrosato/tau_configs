CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone
#TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone/tau-2.27/x86_64

BOOSTLINK=https://sourceforge.net/projects/boost/files/boost/1.67.0/boost_1_67_0.tar.gz
BOOSTTGZ=$TAU_STANDALONE_DIR/boost_1_67_0.tar.gz
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_67_0
#BOOSTLINK=https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz
#BOOSTTGZ=$TAU_STANDALONE_DIR/boost_1_61_0.tar.gz
#BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_61_0


cd $TAU_STANDALONE_DIR

#download and unzip boost
rm -rf $BOOSTDIR
rm -rf $BOOSTTGZ
wget $BOOSTLINK
tar -zxvf $BOOSTTGZ
rm -rf $BOOSTTGZ

#INSTALL BOOST
cd $BOOSTDIR
./bootstrap.sh --prefix=$BOOSTDIR/boost_output
./b2 install -j4
mv boost_output/include .
mv boost_output/lib .
rmdir boost_output

cd $CPATH
