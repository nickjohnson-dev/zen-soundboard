module Soundboard.State exposing (..)

import Soundboard.Types exposing (..)
import Soundboard.Ports exposing (play)


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
