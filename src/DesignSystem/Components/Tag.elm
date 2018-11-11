module DesignSystem.Components.Tag exposing
    ( Tag
    , Theme
    , view
    )

import DesignSystem.Theme as Theme
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (Font)
import Element.Input exposing (button)
import Html.Attributes exposing (style)


type alias Tag =
    { name : String
    , id : Int
    }


type alias Theme palette =
    { bgColor : palette -> Color
    , bgHoverColor : palette -> Color
    , hoverTransition : palette -> String
    , paddingX : palette -> Int
    , paddingY : palette -> Int
    , borderRadius : palette -> Int
    , typeFace : palette -> List Font
    , typeSize : palette -> Int
    , textColor : palette -> Color
    }


view :
    Theme.Theme palette { a | tag : Theme palette }
    -> Tag
    -> Element msg
view theme tag =
    button
        [ Background.color (Theme.value theme.tag.bgColor theme)
        , paddingXY
            (Theme.value theme.tag.paddingX theme)
            (Theme.value theme.tag.paddingY theme)
        , Border.rounded (Theme.value theme.tag.borderRadius theme)
        , Font.family (Theme.value theme.tag.typeFace theme)
        , Font.size (Theme.value theme.tag.typeSize theme)
        , Font.color (Theme.value theme.tag.textColor theme)
        , htmlAttribute <|
            style "transition"
                ("background-color "
                    ++ Theme.value theme.tag.hoverTransition theme
                )
        , mouseOver
            [ Background.color (Theme.value theme.tag.bgHoverColor theme)
            ]
        ]
        { onPress = Nothing
        , label = text tag.name
        }
