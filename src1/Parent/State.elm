module Parent.State exposing (..)
import Parent.Types exposing (..)
import Child.Types as ChildTypes
import Child.State as Child
import Dict

init : ( Model, Cmd Msg)
init =
  let
    (child1, _ ) = Child.init
    (child2, _ ) = Child.init
  in
    ( { money = 0
      , children = Dict.fromList
          [ ( "1", child1 )
          , ( "2", child2 )
          ]
      }
    , Cmd.none
    )

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ChildMsg name msg' ->
      case Dict.get name model.children of
        Nothing ->
          ( model, Cmd.none )
        Just child ->
          let
            (updatedChild, _) =
              Child.update msg' child
          in
            { model
                | children = Dict.insert name updatedChild model.children
            } ! []
    GiveAllowance ->
      let
        perChild =
          10

        total =
          perChild * (Dict.size model.children)
      in
        if model.money - total < 0 then
          model ! []
        else
          { model
              | money = model.money - total
              , children = Dict.map (\_ child -> giveTo perChild child) model.children
          } ! []
    Paycheck amt ->
      { model
          | money = model.money + amt
      } ! []

giveTo : Int -> ChildTypes.Model -> ChildTypes.Model
giveTo amt child =
  fst (Child.update (ChildTypes.ReceiveAllowance amt) child)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
