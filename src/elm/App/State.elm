module App.State exposing (..)

import App.Types exposing (..)
import App.Ports exposing (toneInit)
import Keyboard.State as KeyboardState
import Keyboard.Types as Keyboard


initialOptions : SynthOptions
initialOptions =
    { oscillator =
        { oscType = "sawtooth"
        }
    , volume = -5
    }


init : ( Model, Cmd Msg )
init =
    { keyboard = KeyboardState.init Keyboard.Three
    }
        ! [ toneInit initialOptions ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyboardMsg msg ->
            let
                ( updatedKeyboard, keyboardCmds ) =
                    KeyboardState.update msg model.keyboard
            in
                { model
                    | keyboard = updatedKeyboard
                }
                    ! [ keyboardCmds ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
