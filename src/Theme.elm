module Theme exposing (Subthemes, theme)

import DesignSystem.Components.BodyText as BodyText
import DesignSystem.Components.Button as Button
import DesignSystem.Components.Card as Card
import DesignSystem.Components.H3 as H3
import DesignSystem.Components.H4 as H4
import DesignSystem.Components.Tag as Tag
import DesignSystem.Theme exposing (Theme)
import DesignSystem.Weight as Weight exposing (Weight)
import Element exposing (..)
import Element.Font as Font
import Palette exposing (Palette, palette)


theme : Theme Palette Subthemes
theme =
    { palette = palette
    , page =
        { padding = .space >> .xl
        , bgColor = .color >> .neutral >> .d3
        , cardSpacingX = .space >> .l
        , cardSpacingY = .space >> .l
        }
    , card =
        { bgColor = .color >> .neutral >> .l2
        , paddingX = .space >> .m
        , paddingY = .space >> .m
        , contentSpacing = .space >> .m
        , headerSpacing = .space >> .xs
        , thumbnailHeight = .misc >> .thumbnailHeight
        , tagsSpacingX = .space >> .s
        , tagsSpacingY = .space >> .s
        }
    , button =
        { primaryBgColor = .color >> .primary >> .base
        , primaryBgHoverColor = .color >> .primary >> .d1
        , hoverTransition = .transition >> .medium
        , paddingX = .space >> .l
        , paddingY = .space >> .m
        , borderRadius = .borderRadius >> .tight
        , typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .m
        , textColor = .color >> .neutral >> .l4
        , typeWeight = .font >> .weight >> .bold
        }
    , bodyText =
        { typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .s
        , textColor = .color >> .neutral >> .d2
        }
    , h3 =
        { typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .s
        , textColor = .color >> .neutral >> .d1
        , typeWeight = .font >> .weight >> .extraBold
        , typeTracking = .font >> .tracking >> .wide
        }
    , h4 =
        { typeFace = .font >> .face >> .proximaBold
        , typeSize = .font >> .size >> .l
        , textColor = .color >> .neutral >> .d3
        , typeWeight = .font >> .weight >> .bold
        , typeTracking = .font >> .tracking >> .normal
        }
    , tag =
        { bgColor = .color >> .neutral >> .base
        , bgHoverColor = .color >> .neutral >> .d1
        , hoverTransition = .transition >> .medium
        , paddingX = .space >> .s
        , paddingY = .space >> .s
        , textColor = .color >> .neutral >> .d3
        , typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .s
        , borderRadius = .borderRadius >> .tight
        }
    }


type alias Subthemes =
    { page :
        { padding : Palette -> Int
        , bgColor : Palette -> Color
        , cardSpacingX : Palette -> Int
        , cardSpacingY : Palette -> Int
        }
    , card : Card.Theme Palette
    , button : Button.Theme Palette
    , bodyText : BodyText.Theme Palette
    , h3 : H3.Theme Palette
    , h4 : H4.Theme Palette
    , tag : Tag.Theme Palette
    }
