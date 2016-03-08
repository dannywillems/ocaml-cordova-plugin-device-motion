(* Class representing sent data by the accelerometer *)
class type _Acceleration =
  object
    method x : int Js.readonly_prop
    method y : int Js.readonly_prop
    method z : int Js.readonly_prop
    method timestamp : Js.date Js.t
  end

type id = int
type cb_success = _Acceleration Js.t -> unit
type cb_error = unit -> unit

class type options =
  object
    method frequency : int Js.t
  end

class type accelerometer =
  object
    method getCurrentAcceleration :
      cb_success  ->
      cb_error    ->
      unit Js.meth
    method watchAcceleration :
      cb_success  ->
      cb_error    ->
      options     ->
      id Js.meth
    method clearWatch : id -> unit Js.meth
  end
