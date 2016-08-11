module TimeTut.View exposing (..)

import Html exposing (Html)
import Time exposing (Time)
import Svg exposing (..)
import Html.Events exposing (onClick)
import Svg.Attributes exposing (..)
import TimeTut.Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    let
        angle =
            turns (Time.inMinutes model)

        handX =
            toString (50 + 40 * cos angle)

        handY =
            toString (50 + 40 * sin angle)
    in
        svg
            [ viewBox "0 0 100 100"
            , width "300px"
            , onClick TimeTut.Types.Press
            ]
            [ circle
                [ cx "50"
                , cy "50"
                , r "45"
                , fill "#0B79CE"
                ]
                []
            , line
                [ x1 "50"
                , y1 "50"
                , x2 handX
                , y2 handY
                , stroke "#023963"
                ]
                []
            ]
