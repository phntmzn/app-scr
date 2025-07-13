-- Using `install_name_tool` to inject custom dylib load
do shell script "install_name_tool -add_rpath @executable_path/../Resources/ /Applications/SomeApp.app/Contents/MacOS/SomeApp"
