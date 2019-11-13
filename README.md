# FreeImage binaries

This is a part of [Node3D](https://github.com/node-3d) project.

[![NPM](https://nodei.co/npm/deps-freeimage-raub.png?compact=true)](https://www.npmjs.com/package/deps-freeimage-raub)

[![Build Status](https://api.travis-ci.com/node-3d/deps-freeimage-raub.svg?branch=master)](https://travis-ci.com/node-3d/deps-freeimage-raub)
[![CodeFactor](https://www.codefactor.io/repository/github/node-3d/deps-freeimage-raub/badge)](https://www.codefactor.io/repository/github/node-3d/deps-freeimage-raub)

> npm i deps-freeimage-raub


## Synopsis

This dependency package is distributing **FreeImage 3.17**
binaries through **NPM** for **Node.js** addons.

* Platforms (x64): Windows, Linux, OSX.
* Library: FreeImage.
* Linking: static dll-type.


## Usage

### Example binding.gyp

As in [image-raub](https://github.com/node-3d/image-raub/tree/master/src) Node.js addon.

```javascript
{
	'variables': {
		'bin'        : '<!(node -p "require(\'addon-tools-raub\').bin")',
		'fi_include' : '<!(node -p "require(\'deps-freeimage-raub\').include")',
		'fi_bin'     : '<!(node -p "require(\'deps-freeimage-raub\').bin")',
	},
	'targets': [
		{
			'target_name': 'image',
			'sources': [
				'cpp/bindings.cpp',
				'cpp/image.cpp',
			],
			'include_dirs': [
				'<(fi_include)',
				'<!@(node -p "require(\'addon-tools-raub\').include")',
			],
			'cflags!': ['-fno-exceptions'],
			'cflags_cc!': ['-fno-exceptions'],
			'library_dirs': ['<(fi_bin)'],
			'conditions': [
				[
					'OS=="linux"',
					{
						'libraries': [
							"-Wl,-rpath,'$$ORIGIN'",
							"-Wl,-rpath,'$$ORIGIN/../node_modules/deps-freeimage-raub/<(bin)'",
							"-Wl,-rpath,'$$ORIGIN/../../deps-freeimage-raub/<(bin)'",
							'<(fi_bin)/libfreeimage.so.3',
						],
					}
				],
				[
					'OS=="mac"',
					{
						'libraries': [
							'-Wl,-rpath,@loader_path',
							'-Wl,-rpath,@loader_path/../node_modules/deps-freeimage-raub/<(bin)',
							'-Wl,-rpath,@loader_path/../../deps-freeimage-raub/<(bin)',
							'<(fi_bin)/freeimage.dylib',
						],
						'xcode_settings': {
							'DYLIB_INSTALL_NAME_BASE': '@rpath',
						},
					}
				],
				[
					'OS=="win"',
					{
						'libraries': ['FreeImage.lib'],
						'defines' : [
							'WIN32_LEAN_AND_MEAN',
							'VC_EXTRALEAN'
						],
						'msvs_version'  : '2013',
						'msvs_settings' : {
							'VCCLCompilerTool' : {
								'AdditionalOptions' : [
									'/O2','/Oy','/GL','/GF','/Gm-','/EHsc',
									'/MT','/GS','/Gy','/GR-','/Gd',
								]
							},
							'VCLinkerTool' : {
								'AdditionalOptions' : ['/OPT:REF','/OPT:ICF','/LTCG']
							},
						},
					}
				],
			],
		},
	]
}
```


### addon.cpp

```cpp
#include <FreeImage.h>
```

Refer to [FreeImage 3.17 docs](http://mirrors.dotsrc.org/pub/exherbo/FreeImage3170.pdf).


## Legal notice

This software uses the [FreeImage open source image library](http://freeimage.sourceforge.net).
FreeImage is legally used under the FIPL (FreeImage Public License) version.
It is explicitly stated that FreeImage can be used commercially under FIPL.

FreeImage licensing information (a COPY) is given in a [separate file](/FREEIMAGE_FIPL),
which also can be found on
[FreeImage's official web-site](http://freeimage.sourceforge.net/license.html).
The rest of this package is MIT licensed.

Windows binaries were found on the official web-site.
Unix binaries are found in
[Ubuntu Packages](https://packages.ubuntu.com/source/cosmic/freeimage).
OSX binaries are built through MAKE system with
[Travis CI matrix](https://travis-ci.com/node-3d/deps-freeimage-raub).
See Travis [config](https://github.com/node-3d/deps-freeimage-raub/blob/master/.travis.yml)
for details.
