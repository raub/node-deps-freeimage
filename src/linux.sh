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
	
	mv FreeImage/Dist/libfreeimageplus-3.18.0.so build/libfreeimage.so.3.18
	
)

echo 'FreeImage Build Finished'
