module Child.View exposing (..)
import Child.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

uxtNeutral1 = "#eee"
uxtHeightComponent = "48px"
uxtMarginS = "8px"
uxtMarginM = "16px"

view : Model -> Html Msg
view model =
  div
    [ baseStyle (if model.money == 0 then "red" else "green") ]
    [ div
        [ textStyle ]
        [ text ("Money: " ++ (toString model.money) ++ " Dollars") ]
    , button
        [ pushRight, onClick (RequestAllowance) ]
        [ text "Get Allowance" ]
    , button
        [ onClick (BuyCandy) ]
        [ text "Buy Candy" ]
    ]

baseStyle : String -> Attribute msg
baseStyle color =
  style
    [ ("display", "flex")
    , ("align-items", "center")
    , ("justify-content", "space-between")
    , ("height", uxtHeightComponent)
    , ("margin-bottom", uxtMarginM)
    , ("padding-left", uxtMarginM)
    , ("padding-right", uxtMarginM)
    , ("background-color", color)
    ]

pushRight : Attribute msg
pushRight =
  style
    [ ("margin-left", "auto")
    , ("margin-right", uxtMarginM)
    ]

textStyle : Attribute msg
textStyle =
  style
    [ ("margin-right", uxtMarginM)
    ]
