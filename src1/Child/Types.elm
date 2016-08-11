module Child.Types exposing (..)

type alias Model =
  { money : Int
  }

type Msg
  = BuyCandy
  | ReceiveAllowance Int
  | RequestAllowance
