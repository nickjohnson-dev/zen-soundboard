module App.State exposing (..)

import App.Types exposing (..)
import App.Ports exposing (play)


init : ( Model, Cmd Msg )
init =
    Model fullScale ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Play note ->
            model ! [ play note ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
