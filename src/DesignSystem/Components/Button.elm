module DesignSystem.Components.Button exposing
    ( Theme
    , buttonView
    )

import DesignSystem.Theme as Theme
import DesignSystem.Weight as Weight exposing (Weight)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (Font)
import Element.Input exposing (button)
import Html.Attributes exposing (style)


buttonView : Theme.Theme palette { a | button : Theme palette } -> String -> Element msg
buttonView theme buttonText =
    button
        [ Background.color (Theme.value theme.button.primaryBgColor theme)
        , paddingXY
            (Theme.value theme.button.paddingX theme)
            (Theme.value theme.button.paddingY theme)
        , Border.rounded (Theme.value theme.button.borderRadius theme)
        , Font.family (Theme.value theme.button.typeFace theme)
        , Weight.toAttribute <| Theme.value theme.button.typeWeight theme
        , Font.size (Theme.value theme.button.typeSize theme)
        , Font.color (Theme.value theme.button.textColor theme)
        , htmlAttribute <|
            style "transition"
                ("background-color "
                    ++ Theme.value theme.button.hoverTransition theme
                )
        , mouseOver
            [ Background.color (Theme.value theme.button.primaryBgHoverColor theme)
            ]
        ]
        { onPress = Nothing
        , label = text buttonText
        }


type alias Theme palette =
    { primaryBgColor : palette -> Color
    , primaryBgHoverColor : palette -> Color
    , hoverTransition : palette -> String
    , paddingX : palette -> Int
    , paddingY : palette -> Int
    , borderRadius : palette -> Int
    , typeFace : palette -> List Font
    , typeSize : palette -> Int
    , textColor : palette -> Color
    , typeWeight : palette -> Weight
    }
