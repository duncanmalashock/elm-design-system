module DesignSystem.Components.H4 exposing
    ( Theme
    , view
    )

import DesignSystem.Layout.TextBlock exposing (textBlock)
import DesignSystem.Theme as Theme
import DesignSystem.Values.Weight as Weight exposing (Weight)
import Element exposing (..)
import Element.Font as Font exposing (Font)


view :
    Theme.Theme palette { a | h4 : Theme palette }
    -> String
    -> Element msg
view theme content =
    textBlock
        [ Font.family (Theme.value theme.h4.typeFace theme)
        , Font.size (Theme.value theme.h4.typeSize theme)
        , Weight.toAttribute <| Theme.value theme.h4.typeWeight theme
        , Font.letterSpacing (Theme.value theme.h4.typeTracking theme)
        , Font.color (Theme.value theme.h4.textColor theme)
        ]
        [ text content ]


type alias Theme palette =
    { typeFace : palette -> List Font
    , typeSize : palette -> Int
    , typeWeight : palette -> Weight
    , typeTracking : palette -> Float
    , textColor : palette -> Color
    }
