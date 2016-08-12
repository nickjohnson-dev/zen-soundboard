module App.State exposing (..)

import App.Types exposing (..)
import App.Ports exposing (..)


initialOptions : SynthOptions
initialOptions =
    { oscillator =
        { oscType = "pwm"
        }
    , volume = -15
    }


init : ( Model, Cmd Msg )
init =
    { noteNames = fullScale
    , octave = 3
    }
        ! [ toneInit initialOptions ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Attack noteName ->
            model
                ! [ attack
                        { name = noteName
                        , length = "16n"
                        }
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
