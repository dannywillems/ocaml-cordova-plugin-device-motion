# ocaml-cordova-plugin-device-motion

Binding to
[cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

[Example
application](https://github.com/dannywillems/ocaml-cordova-plugin-device-motion-example).

## What does cordova-plugin-device-motion do ?

```
This plugin defines a global device object, which describes the device's
hardware and software. Although the object is in the global scope, it is not
available until after the deviceready event.
```

Source: [cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

## How to use ?

See the official documentation
[cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

## ! BE CAREFUL !

The device plugin creates a new object called *navigator.accelerometer*, but the object is
available when the *deviceready* event is handled.

We don't provide a *navigator.accelerometer* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *navigator.accelerometer* will be set to **undefined**
because the *navigator.accelerometer* object doesn't exist when we create the variable.

You need to create a variable of type *Accelerometer.accelerometer Js.t* in the *deviceready*
event handler.
So, use

```OCaml
let on_device_ready =
  let d : Accelerometer.accelerometer Js.t = Js.Unsafe.js_expr
  ("navigation.accelerometer") in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
