CPATH=$PWD

TAU_STANDALONE_DIR=/home/naookiesato/Documents/tau_standalone

#BUILD DYNINST TESTSUITE
TESTSUITEDIR=$TAU_STANDALONE_DIR/testsuite
cd $TAU_STANDALONE_DIR
rm -rf $TESTSUITEDIR
git clone https://github.com/dyninst/testsuite
cd $TESTSUITEDIR
cmake $TESTSUITEDIR -DPLATFORM=x86_64-unknown-linux2.4
make

cd $CPATH
