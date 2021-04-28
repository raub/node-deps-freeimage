echo 'FreeImage Build Started'

(
	
	cd src
	unzip -qq FreeImage3180.zip -d .
	
	mkdir -p build
	
	(
		cd FreeImage
		
		export DYLIB_INSTALL_NAME_BASE=@rpath
		make -f Makefile.osx \
			CPP_X86_64='g++ -w' \
			CC_X86_64='gcc -w' \
			COMPILERFLAGS_X86_64='-arch x86_64 -D__ANSI__ -DDISABLE_PERF_MEASUREMENT' \
			LIBRARIES_X86_64='-flat_namespace -install_name "@rpath/freeimage.dylib" -Wl,-syslibroot /Applications/Xcode_12.4.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk' \
			INCLUDE_X86_64='-isysroot /Applications/Xcode_12.4.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk' \
			libfreeimage-3.18.0.dylib-x86_64 \
			>/dev/null
		
	)
	
	mv FreeImage/libfreeimage-3.18.0.dylib-x86_64 build/freeimage.dylib
	
)

echo 'FreeImage Build Finished'
