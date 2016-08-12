module App.View exposing (..)

import App.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    div
        [ class "app" ]
        [ div
            [ class "keys" ]
            (getOctave model.noteNames model.octave)
        , (div
            [ class "octave-shifters" ]
            [ div
                [ class "octave-shifter"
                , onClick OctaveDown
                ]
                [ text "Octave Down" ]
            , div
                [ class "octave-shifter"
                , onClick OctaveUp
                ]
                [ text "Octave Up" ]
            ]
          )
        ]


key : String -> Html Msg
key noteName =
    div
        [ class "key"
        , onMouseDown (Attack noteName)
        , onMouseLeave (Release)
        , onMouseUp (Release)
        ]
        [ text noteName ]


getOctave : List String -> Int -> List (Html Msg)
getOctave noteNames octave =
    noteNames
        |> List.drop (octave * 12)
        |> List.take 12
        |> List.map key
