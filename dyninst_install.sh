CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone

#INSTALL BOOST
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

#BUILD DYNINST
DYNINSTTGZ=/home/naookiesato/Downloads/dyninst-9.3.2.tar.gz
#DYNINSTTGZ=/home/naookiesato/Downloads/DyninstAPI-9.0.3.tgz
DYNINSTSRCDIR=$TAU_STANDALONE_DIR/dyninst-9.3.2
#DYNINSTSRCDIR=$TAU_STANDALONE_DIR/DyninstAPI-9.0.3
DYNINSTBUILDDIR=$TAU_STANDALONE_DIR/build-dyninst
#unzip dyninst
cd $TAU_STANDALONE_DIR
rm -rf $DYNINSTSRCDIR
tar -zxvf $DYNINSTTGZ
rm -rf $DYNINSTBUILDDIR
mkdir $DYNINSTBUILDDIR
cd $DYNINSTBUILDDIR
cmake $DYNINSTSRCDIR -DBoost_INCLUDE_DIR=$BOOSTDIR -DCMAKE_INSTALL_PREFIX=$DYNINSTBUILDDIR
make
make install
cp libelf/lib/libelf-0.168.so lib/libelf-0.168.so
cd lib
ln -s libelf-0.168.so libelf.so
cd $DYNINSTBUILDDIR
cp libiberty/libiberty.a lib/libiberty.a

##BUILD SHARED libiberty (libiberty.so)
#GCCGIT=https://github.com/gcc-mirror/gcc.git
#GCCSRCDIR=$TAU_STANDALONE_DIR/gcc
#IBERTYSRCDIR=$GCCSRCDIR/libiberty
#cd $TAU_STANDALONE_DIR
#git clone $GCCGIT
#cd $IBERTYSRCDIR
#$IBERTYSRCDIR/configure --enable-shared --prefix=$IBERTYSRCDIR
#ld -G -Bdynamic pic/*.o -o libiberty.so
#cp libiberty.so $DYNINSTBUILDDIR/lib/libiberty.so

cd $CPATH
