echo 'FreeImage Build Started'

(
	
	cd src
	rm -rf FreeImage
	unzip -qq FreeImage3180.zip -d .
	
	mkdir -p build
	
	(
		cd FreeImage
		
		make -f Makefile.fip
		
	)
	
	mv glew-2.1.0/lib/libfreeimage.so.2.1.0 build/libGLEW.so.2.1
	mv FreeImage/libfreeimage.so.3.18 freeimage.so
	
)

echo 'FreeImage Build Finished'
