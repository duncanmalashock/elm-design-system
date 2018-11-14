module Theme exposing (Subthemes, theme)

import DesignSystem.Components.BodyText as BodyText
import DesignSystem.Components.Button as Button
import DesignSystem.Components.Card as Card
import DesignSystem.Components.H3 as H3
import DesignSystem.Components.H4 as H4
import DesignSystem.Components.Modal as Modal
import DesignSystem.Components.Tag as Tag
import DesignSystem.Shadow as Shadow
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
        , bgColor = .color >> .neutral >> .l3
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
        { primaryBgColor = .color >> .primary >> .l3
        , primaryBgHoverColor = .color >> .primary >> .l2
        , primaryTextColor = .color >> .primary >> .base
        , primaryHoverTextColor = .color >> .primary >> .d1
        , secondaryBgColor = .color >> .neutral >> .l3
        , secondaryBgHoverColor = .color >> .neutral >> .l2
        , secondaryTextColor = .color >> .neutral >> .d2
        , secondaryHoverTextColor = .color >> .neutral >> .d3
        , dangerBgColor = .color >> .danger >> .l3
        , dangerBgHoverColor = .color >> .danger >> .l2
        , dangerTextColor = .color >> .danger >> .base
        , dangerHoverTextColor = .color >> .danger >> .d3
        , hoverTransition = .transition >> .none
        , paddingX = .space >> .m
        , paddingY = .space >> .s
        , borderRadius = .borderRadius >> .tight
        , typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .s
        , typeWeight = .font >> .weight >> .bold
        , typeTracking = .font >> .tracking >> .normal
        }
    , bodyText =
        { typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .s
        , textColor = .color >> .neutral >> .d2
        }
    , h3 =
        { typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .m
        , textColor = .color >> .neutral >> .d3
        , typeWeight = .font >> .weight >> .bold
        , typeTracking = .font >> .tracking >> .normal
        }
    , h4 =
        { typeFace = .font >> .face >> .proximaRegular
        , typeSize = .font >> .size >> .m
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
    , modal =
        { bgColor = .color >> .neutral >> .l4
        , bodyPaddingX = .space >> .m
        , bodyPaddingY = .space >> .l
        , actionsPaddingX = .space >> .m
        , actionsPaddingY = .space >> .s
        , topHighlightColor = .color >> .danger >> .base
        , topHighlightWidth = .space >> .xs
        , iconColor = .color >> .danger >> .base
        , actionsBgColor = .color >> .neutral >> .l3
        , headerBodySpacing = .space >> .m
        , iconTextSpacing = .space >> .m
        , buttonSpacing = .space >> .s
        , shadowSpread = .shadow >> .large
        , shadowColor = .color >> .primary >> .d3
        , shadowOpacity = .opacity >> .light
        , width = .misc >> .modalWidth
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
    , modal : Modal.Theme Palette
    , bodyText : BodyText.Theme Palette
    , h3 : H3.Theme Palette
    , h4 : H4.Theme Palette
    , tag : Tag.Theme Palette
    }
