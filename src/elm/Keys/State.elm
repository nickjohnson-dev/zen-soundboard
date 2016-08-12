module Keys.State exposing (..)

import Keys.Types exposing (..)
import Keys.Ports exposing (..)


initialOptions : SynthOptions
initialOptions =
    { oscillator =
        { oscType = "pwm"
        }
    , volume = -15
    }


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
