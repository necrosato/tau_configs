CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone

BOOSTTGZ=/home/naookiesato/Downloads/boost_1_61_0.tar.gz
BOOSTDIR=$TAU_STANDALONE_DIR/boost_1_61_0

cd $TAU_STANDALONE_DIR

#unzip boost
rm -rf $BOOSTDIR
tar -zxvf $BOOSTTGZ

#INSTALL BOOST
cd $BOOSTDIR
./bootstrap.sh --prefix=$BOOSTDIR/boost_output
./b2 install -j4
mv boost_output/include .
mv boost_output/lib .
rmdir boost_output

cd $CPATH
