module App.Types exposing (..)


type alias Model =
    { notes : List String
    }


type Msg
    = Play String


fullScale : List String
fullScale =
    List.concatMap
        (\num -> List.map (\letter -> letter ++ num) [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ])
        [ "2", "3", "4", "5" ]
