module Keyboard.State exposing (..)

import App.Ports exposing (attack, release)
import App.Types as App
import Keyboard.Types exposing (..)
import Debug exposing (log)


init : Octave -> Model
init initialOctave =
    Model (octaveToInt initialOctave)


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case (log "Keyboard Message" msg) of
        Attack noteName ->
            model
                ! [ attack
                        (App.Note noteName "16n")
                  ]

        Release ->
            model ! [ release True ]

        OctaveDown ->
            if model.octave < 1 then
                model ! []
            else
                { model | octave = model.octave - 1 } ! []

        OctaveUp ->
            if model.octave > 4 then
                model ! []
            else
                { model | octave = model.octave + 1 } ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
