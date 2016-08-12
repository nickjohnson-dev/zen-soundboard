module Main exposing (..)

import Html.App as Html
import App.State exposing (..)
import App.Types exposing (..)
import App.View exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
