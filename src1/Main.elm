module Main exposing (..)

import Html.App as Html
import Soundboard.State exposing (..)
import Soundboard.Types exposing (..)
import Soundboard.View exposing (..)


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
