module DesignSystem.Components.Button exposing
    ( ButtonType(..)
    , Config
    , Theme
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


type alias Config =
    { labelText : String
    , buttonType : ButtonType
    }


type ButtonType
    = Primary
    | Danger
    | Secondary


buttonView : Theme.Theme palette { a | button : Theme palette } -> Config -> Element msg
buttonView theme config =
    let
        { backgroundColor, backgroundHoverColor, textColor, hoverTextColor } =
            case config.buttonType of
                Primary ->
                    { backgroundColor = Theme.value theme.button.primaryBgColor theme
                    , backgroundHoverColor = Theme.value theme.button.primaryBgHoverColor theme
                    , textColor = Theme.value theme.button.primaryTextColor theme
                    , hoverTextColor = Theme.value theme.button.primaryHoverTextColor theme
                    }

                Danger ->
                    { backgroundColor = Theme.value theme.button.dangerBgColor theme
                    , backgroundHoverColor = Theme.value theme.button.dangerBgHoverColor theme
                    , textColor = Theme.value theme.button.dangerTextColor theme
                    , hoverTextColor = Theme.value theme.button.dangerHoverTextColor theme
                    }

                Secondary ->
                    { backgroundColor = Theme.value theme.button.secondaryBgColor theme
                    , backgroundHoverColor = Theme.value theme.button.secondaryBgHoverColor theme
                    , textColor = Theme.value theme.button.secondaryTextColor theme
                    , hoverTextColor = Theme.value theme.button.secondaryHoverTextColor theme
                    }
    in
    button
        [ Background.color backgroundColor
        , paddingXY
            (Theme.value theme.button.paddingX theme)
            (Theme.value theme.button.paddingY theme)
        , Border.rounded (Theme.value theme.button.borderRadius theme)
        , Font.family (Theme.value theme.button.typeFace theme)
        , Weight.toAttribute <| Theme.value theme.button.typeWeight theme
        , Font.size (Theme.value theme.button.typeSize theme)
        , Font.color textColor
        , Font.letterSpacing (Theme.value theme.button.typeTracking theme)
        , htmlAttribute <|
            style "transition"
                ("background-color "
                    ++ Theme.value theme.button.hoverTransition theme
                )
        , mouseOver
            [ Background.color backgroundHoverColor
            , Font.color hoverTextColor
            ]
        ]
        { onPress = Nothing
        , label = text config.labelText
        }


type alias Theme palette =
    { primaryBgColor : palette -> Color
    , primaryBgHoverColor : palette -> Color
    , primaryTextColor : palette -> Color
    , primaryHoverTextColor : palette -> Color
    , secondaryBgColor : palette -> Color
    , secondaryBgHoverColor : palette -> Color
    , secondaryTextColor : palette -> Color
    , secondaryHoverTextColor : palette -> Color
    , dangerBgColor : palette -> Color
    , dangerBgHoverColor : palette -> Color
    , dangerTextColor : palette -> Color
    , dangerHoverTextColor : palette -> Color
    , hoverTransition : palette -> String
    , paddingX : palette -> Int
    , paddingY : palette -> Int
    , borderRadius : palette -> Int
    , typeFace : palette -> List Font
    , typeSize : palette -> Int
    , typeWeight : palette -> Weight
    , typeTracking : palette -> Float
    }
