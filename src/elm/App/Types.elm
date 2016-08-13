module App.Types exposing (..)

import Keyboard.Types as Keyboard


type alias Model =
    { keyboard : Keyboard.Model
    }


type Msg
    = KeyboardMsg Keyboard.Msg


type alias Note =
    { name : String
    , length : String
    }


type alias SynthOptions =
    { oscillator :
        { oscType : String
        }
    , volume : Int
    }
