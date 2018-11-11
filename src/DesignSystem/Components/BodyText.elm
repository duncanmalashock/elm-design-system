module DesignSystem.Components.BodyText exposing
    ( Theme
    , view
    )

import DesignSystem.Layout.TextBlock exposing (textBlock)
import DesignSystem.Theme as Theme
import Element exposing (..)
import Element.Font as Font exposing (Font)


view :
    Theme.Theme palette { a | bodyText : Theme palette }
    -> String
    -> Element msg
view theme content =
    textBlock
        [ Font.family (Theme.value theme.bodyText.typeFace theme)
        , Font.size (Theme.value theme.bodyText.typeSize theme)
        , Font.color (Theme.value theme.bodyText.textColor theme)
        ]
        [ text content ]


type alias Theme palette =
    { typeFace : palette -> List Font
    , typeSize : palette -> Int
    , textColor : palette -> Color
    }
