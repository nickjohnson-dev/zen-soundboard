module Soundboard.View exposing (..)

import Soundboard.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    div []
        (List.map noteButton model.notes)


noteButton : String -> Html Msg
noteButton note =
    button
        [ buttonStyle
        , onMouseEnter (Play note)
        ]
        [ text ("Play " ++ note) ]


buttonStyle : Attribute msg
buttonStyle =
    style
        [ ( "display", "block" ) ]
