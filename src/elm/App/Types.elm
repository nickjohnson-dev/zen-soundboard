module App.Types exposing (..)


type alias Model =
    { noteNames : List String
    , octave : Int
    }


type Msg
    = Attack String
    | OctaveDown
    | OctaveUp
    | Release


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


lengths : List String
lengths =
    [ "32n"
    , "16n"
    , "8n"
    , "4n"
    , "2n"
    , "1n"
    ]


fullScale : List String
fullScale =
    List.concatMap
        (\num ->
            List.map
                (\letter -> letter ++ num)
                [ "C"
                , "C#"
                , "D"
                , "D#"
                , "E"
                , "F"
                , "F#"
                , "G"
                , "G#"
                , "A"
                , "A#"
                , "B"
                ]
        )
        [ "0"
        , "1"
        , "2"
        , "3"
        , "4"
        , "5"
        ]
