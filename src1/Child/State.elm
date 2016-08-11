module Child.State exposing (..)
import Child.Types exposing (..)

init : ( Model, Cmd Msg)
init =
  ( Model 0
  , Cmd.none
  )

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    BuyCandy ->
      { model
          | money = if model.money - 5 < 0
              then model.money
              else model.money - 5
      } ! []

    ReceiveAllowance amt ->
      { model
          | money = model.money + amt
      } ! []

    RequestAllowance ->
      model ! []

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
