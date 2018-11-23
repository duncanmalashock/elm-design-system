module DesignSystem.Values.Weight exposing (Weight(..), toAttribute)

import Element
import Element.Font as Font


type Weight
    = Heavy
    | ExtraBold
    | Bold
    | SemiBold
    | Medium
    | Regular
    | Light
    | ExtraLight
    | Hairline


toAttribute : Weight -> Element.Attribute msg
toAttribute weight =
    case weight of
        Heavy ->
            Font.heavy

        ExtraBold ->
            Font.extraBold

        Bold ->
            Font.bold

        SemiBold ->
            Font.semiBold

        Medium ->
            Font.medium

        Regular ->
            Font.regular

        Light ->
            Font.light

        ExtraLight ->
            Font.extraLight

        Hairline ->
            Font.hairline
