-- Replace original with proxy using `install_name_tool`
do shell script "install_name_tool -change @rpath/libtarget.dylib @rpath/shim.dylib /Applications/Target.app/Contents/MacOS/Target"
