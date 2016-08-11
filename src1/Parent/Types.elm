module Parent.Types exposing (..)
import Child.Types as Child
import Dict

type alias Model =
  { money : Int
  , children : Dict.Dict String Child.Model
  }

type Msg
  = ChildMsg String Child.Msg
  | GiveAllowance
  | Paycheck Int
