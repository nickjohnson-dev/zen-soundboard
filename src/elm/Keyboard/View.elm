module Keyboard.View exposing (..)

import Keyboard.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String


view : Model -> Html Msg
view model =
    div
        [ class "keyboard" ]
        [ div
            [ class "keyboard__keys" ]
            [ div
                [ class "keyboard__keys__black-keys" ]
                (getBlackKeys model.octave)
            , div
                [ class "keyboard__keys__white-keys" ]
                (getWhiteKeys model.octave)
            ]
        , (div
            [ class "keyboard__octave-shifters" ]
            [ div
                [ class "keyboard__octave-shifters__shifter"
                , onClick OctaveDown
                ]
                [ text "Octave Down" ]
            , div
                [ class "keyboard__octave-shifters__shifter"
                , onClick OctaveUp
                ]
                [ text "Octave Up" ]
            ]
          )
        ]


getBlackKeys : Int -> List (Html Msg)
getBlackKeys octaveNumber =
    [ "S", "S", "C#", "S", "D#", "S", "S", "S", "S", "F#", "S", "G#", "S", "A#", "S", "S", "S", "S", "S" ]
        |> List.map (\name -> String.append name (toString octaveNumber))
        |> List.map key


getWhiteKeys : Int -> List (Html Msg)
getWhiteKeys octaveNumber =
    [ "C", "D", "E", "F", "G", "A", "B" ]
        |> List.map (\name -> String.append name (toString octaveNumber))
        |> List.map key
        |> \list -> List.append list [ key ("C" ++ (toString (octaveNumber + 1))) ]


key : String -> Html Msg
key name =
    div
        [ class ("keyboard__key keyboard__key--" ++ (String.dropRight 1 name))
        , onMouseDown (Attack name)
        , onMouseLeave (Release)
        , onMouseUp (Release)
        ]
        [ text name ]


letters : List String
letters =
    [ "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" ]


octaveNumbers : List Int
octaveNumbers =
    [ 0, 1, 2, 3, 4, 5 ]
