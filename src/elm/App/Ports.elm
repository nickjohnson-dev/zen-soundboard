port module App.Ports exposing (..)

import App.Types exposing (..)


port toneInit : SynthOptions -> Cmd msg


port attack : Note -> Cmd msg


port release : Bool -> Cmd msg
