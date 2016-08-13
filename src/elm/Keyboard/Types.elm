module Keyboard.Types exposing (..)


type alias Model =
    { octave : Int
    , isPlaying : Bool
    }


type Msg
    = Attack String
    | OctaveDown
    | OctaveUp
    | Release


type Octave
    = One
    | Two
    | Three
    | Four
    | Five


octaveToInt : Octave -> Int
octaveToInt octave =
    case octave of
        One ->
            1

        Two ->
            2

        Three ->
            3

        Four ->
            4

        Five ->
            5
