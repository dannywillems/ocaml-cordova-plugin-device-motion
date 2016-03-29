(* -------------------------------------------------------------------------- *)
(* Class representing sent data by the accelerometer *)
class acceleration : Ojs.t ->
  object
    inherit Ojs.obj
    method x          : int
    method y          : int
    method z          : int
    method timestamp  : Js_date.date (* See ocaml-js-stdlib *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class options : Ojs.t ->
  object
    inherit Ojs.obj
    method frequency    : int
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class accelerometer : Ojs.t ->
  object
    inherit Ojs.obj
    method get_current_acceleration : (acceleration -> unit)  ->
                                      (unit -> unit)          ->
                                      unit

    method watch_acceleration       : (acceleration -> unit)  ->
                                      (unit -> unit)          ->
                                      options                 ->
                                      int
    method clear_watch              : int                     ->
                                      unit
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val create_options : ?frequency:(int [@js.default 1000]) -> options
[@@js.builder]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val accelerometer : unit -> accelerometer Js.t
[@@js.get "navigator.accelerometer"]
(* -------------------------------------------------------------------------- *)
