# ocaml-cordova-plugin-device-motion

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-device-motion/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-device-motion.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-device-motion)

Binding to
[cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-device-motion-example).

## What does cordova-plugin-device-motion do ?

```
This plugin provides access to the device's accelerometer. The accelerometer is
a motion sensor that detects the change (delta) in movement relative to the
current device orientation, in three dimensions along the x, y, and z axis.
Access is via a global navigator.accelerometer object.
Although the object is attached to the global scoped navigator, it is not
available until after the deviceready event.
```

Source: [cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

## Repository branches and tags

We are migrating bindings from
[js_of_ocaml](https://github.com/ocsigen/js_of_ocaml) (low level bindings) to
[gen_js_api](https://github.com/lexifi/gen_js_api) (high level bindings).

The gen_js_api binding allows to use *pure* ocaml types (you don't have to use
the ## syntax from js_of_ocaml or Js.string type but only # and string type).

The js_of_ocaml version is available in the branch
[*js_of_ocaml*](https://github.com/dannywillems/ocaml-cordova-plugin-device-motion/tree/js_of_ocaml)
but we **recommend** to use the gen_js_api version which is the master branch.

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-device-motion https://github.com/dannywillems/ocaml-cordova-plugin-device-motion.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package ocaml-js-stdlib -package cordova-plugin-device-motion [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin device motion with
```Shell
cordova plugin add cordova-plugin-device-motion
```

## How to use ?

You need to have Js_date module which is provided in the binding to the
javascript standard library you can found
[here](https://github.com/dannywillems/ocaml-js-stdlib).

See the official documentation
[cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)
