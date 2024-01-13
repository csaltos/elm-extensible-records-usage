module Sample1 exposing (..)

import Browser
import Html
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Theme exposing (Theme)


type alias Model =
    Theme
        { greeting : String
        }


type Msg
    = MsgChangeTheme


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


init : Model
init =
    { greeting = "Sample 1", foregroundColor = "black", backgroundColor = "white", fontSize = 10 }


view : Model -> Html.Html Msg
view model =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "flex-direction" "column"
        ]
        [ viewGreeting model
        , viewChangeThemeButton
        ]


viewGreeting : Model -> Html.Html msg
viewGreeting model =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "justify-content" "space-around"
        , style "background-color" model.backgroundColor
        ]
        [ Html.div
            [ style "color" model.foregroundColor
            , style "font-size" (String.fromInt model.fontSize ++ "px")
            ]
            [ Html.text model.greeting
            ]
        ]


viewChangeThemeButton : Html.Html Msg
viewChangeThemeButton =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "flex-direction" "column"
        ]
        [ Html.button [ onClick MsgChangeTheme ] [ Html.text "Change theme" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        MsgChangeTheme ->
            { model | foregroundColor = "white", backgroundColor = "black", fontSize = 22 }
