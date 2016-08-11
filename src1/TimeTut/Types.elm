module TimeTut.Types exposing (..)

import Time exposing (Time)


type alias Model =
    Time


type Msg
    = Tick Time
    | Press
