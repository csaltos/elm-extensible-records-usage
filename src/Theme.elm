module Theme exposing (..)

type alias Theme r =
    { r
        | backgroundColor : String
        , foregroundColor : String
        , fontSize : Int
    }
