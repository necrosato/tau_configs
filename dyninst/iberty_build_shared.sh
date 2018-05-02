CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone

#BUILD SHARED libiberty (libiberty.so)
GCCGIT=https://github.com/gcc-mirror/gcc.git
GCCSRCDIR=$TAU_STANDALONE_DIR/gcc
IBERTYSRCDIR=$GCCSRCDIR/libiberty
IBERTYPATH=/home/naookiesato/Downloads/libiberty.so
cd $TAU_STANDALONE_DIR
rm -rf $GCCSRCDIR
git clone $GCCGIT
cd $IBERTYSRCDIR
$IBERTYSRCDIR/configure --enable-shared --prefix=$IBERTYSRCDIR
ld -G -Bdynamic pic/*.o -o libiberty.so
cp libiberty.so $IBERTYPATH

cd $CPATH
rm -rf $GCCSRCDIR
