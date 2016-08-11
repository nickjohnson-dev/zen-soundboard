module TimeTut.State exposing (..)

import Time exposing (Time, millisecond)
import TimeTut.Types exposing (..)
import TimeTut.Ports exposing (press)


init : ( Model, Cmd Msg )
init =
    0 ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            time ! []

        Press ->
            model ! [ press True ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (millisecond * 16) Tick
