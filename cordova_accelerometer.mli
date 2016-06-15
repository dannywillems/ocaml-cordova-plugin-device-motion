(* -------------------------------------------------------------------------- *)
(* Class representing sent data by the accelerometer *)
type acceleration = private Ojs.t

val acceleration_x : acceleration -> int
[@@js.get "x"]
val acceleration_y : acceleration -> int
[@@js.get "y"]
val acceleration_z : acceleration -> int
[@@js.get "z"]
val acceleration_timestanp : acceleration -> Js_date.t
[@@js.get "timestamp"]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type options = private Ojs.t

val create_options :
  ?frequency:(int [@js.default 1000]) ->
  unit                                ->
  options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val get_current_acceleration :
  (acceleration -> unit)  ->
  (unit -> unit)          ->
  unit
[@@js.global "navigator.accelerometer.getCurrentAcceleration"]

val watch_acceleration :
  (acceleration -> unit)  ->
  (unit -> unit)          ->
  options                 ->
  int
[@@js.global "navigator.accelerometer.watchAcceleration"]

val clear_watch :
  int                     ->
  unit
[@@js.global "navigator.accelerometer.clearWatch"]
(* -------------------------------------------------------------------------- *)
