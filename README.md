# ocaml-cordova-plugin-device-motion

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

## How to use ?

See the official documentation
[cordova-plugin-device-motion](https://github.com/apache/cordova-plugin-device-motion)

## ! BE CAREFUL !

The device plugin creates a new object called *navigator.accelerometer*, but the object is
available when the *deviceready* event is handled.

We don't provide a *navigator.accelerometer* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *navigator.accelerometer* will be set to **undefined**
because the *navigator.accelerometer* object doesn't exist when we create the variable.

Instead, we provide a function *Accelerometer.accelerometer* of type unit -> Accelerometer.accelerometer
Js.t which does the binding when you call it.
So, use

```OCaml
let on_device_ready =
  let a = Accelerometer.accelerometer () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
