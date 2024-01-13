module Sample3 exposing (..)

import Browser
import Html
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Theme exposing (Theme)


type alias CustomTheme =
    Theme { margin : Int }


type alias Model =
    { greeting : String
    , theme : CustomTheme
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
    { greeting = "Sample 3"
    , theme = { margin = 0, foregroundColor = "black", backgroundColor = "white", fontSize = 10 }
    }


view : Model -> Html.Html Msg
view model =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "flex-direction" "column"
        ]
        [ viewGreetingGeneric model.greeting model.theme
        , viewGreetingCustom model.greeting model.theme
        , viewChangeThemeButton
        ]


viewGreetingGeneric : String -> Theme r -> Html.Html msg
viewGreetingGeneric greeting theme =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "justify-content" "space-around"
        , style "background-color" theme.backgroundColor
        ]
        [ Html.div
            [ style "color" theme.foregroundColor
            , style "font-size" (String.fromInt theme.fontSize ++ "px")
            ]
            [ Html.text (greeting ++ " Generic")
            ]
        ]


viewGreetingCustom : String -> CustomTheme -> Html.Html msg
viewGreetingCustom greeting theme =
    Html.div
        [ style "padding" "3em"
        , style "display" "flex"
        , style "margin" (String.fromInt theme.margin ++ "em")
        , style "justify-content" "space-around"
        , style "background-color" theme.backgroundColor
        ]
        [ Html.div
            [ style "color" theme.foregroundColor
            
            , style "font-size" (String.fromInt theme.fontSize ++ "px")
            ]
            [ Html.text (greeting ++ " Custom")
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
            { model | theme = { margin = 5, foregroundColor = "white", backgroundColor = "black", fontSize = 22 } }
