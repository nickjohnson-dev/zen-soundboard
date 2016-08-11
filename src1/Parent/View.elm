module Parent.View exposing (..)
import Parent.Types exposing (..)
import Child.Types as ChildTypes
import Child.View as Child
import Html exposing (..)
import Html.App as App
import Html.Events exposing (..)
import Dict

view : Model -> Html Msg
view model =
  div
    []
    [ div [] (List.map drawChild (Dict.toList model.children))
    , div [] [ text (toString model.money) ]
    , button
        [ onClick (Paycheck 50) ]
        [ text "GetPaycheck" ]
    , button
        [ onClick (GiveAllowance) ]
        [ text "Give Allowance" ]
    ]

drawChild : (String, ChildTypes.Model) -> Html Msg
drawChild (name, childModel) =
  App.map (ChildMsg name) (Child.view childModel)
