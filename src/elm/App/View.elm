module App.View exposing (..)

import App.Types exposing (..)
import Keyboard.View as KeyboardView
import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)


view : Model -> Html Msg
view model =
    div
        [ class "app" ]
        [ App.map KeyboardMsg (KeyboardView.view model.keyboard)
        ]
