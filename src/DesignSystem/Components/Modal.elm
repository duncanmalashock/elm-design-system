module DesignSystem.Components.Modal exposing
    ( Modal
    , Theme
    , view
    )

import DesignSystem.Components.BodyText as BodyText exposing (..)
import DesignSystem.Components.Button as Button exposing (..)
import DesignSystem.Components.H3 as H3 exposing (..)
import DesignSystem.Shadow as Shadow
import DesignSystem.Theme as Theme
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Svg exposing (path, svg)
import Svg.Attributes as Svg exposing (d, viewBox)


type alias Modal =
    { title : String
    , body : String
    , cancelButton : String
    , confirmButton : String
    }


type alias Theme palette =
    { bgColor : palette -> Color
    , bodyPaddingX : palette -> Int
    , bodyPaddingY : palette -> Int
    , actionsPaddingX : palette -> Int
    , actionsPaddingY : palette -> Int
    , topHighlightWidth : palette -> Int
    , topHighlightColor : palette -> Color
    , iconColor : palette -> Color
    , actionsBgColor : palette -> Color
    , headerBodySpacing : palette -> Int
    , iconTextSpacing : palette -> Int
    , buttonSpacing : palette -> Int
    , shadowSpread : palette -> Shadow.Spread
    , shadowColor : palette -> Color
    , shadowOpacity : palette -> Float
    , width : palette -> Int
    }


view :
    Theme.Theme palette
        { a
            | modal : Theme palette
            , button : Button.Theme palette
            , h3 : H3.Theme palette
            , bodyText : BodyText.Theme palette
        }
    -> Modal
    -> Element msg
view theme modal =
    let
        bodyView =
            el
                [ width fill
                , paddingXY
                    (Theme.value theme.modal.bodyPaddingX theme)
                    (Theme.value theme.modal.bodyPaddingY theme)
                , Background.color <| Theme.value theme.modal.bgColor theme
                ]
                (row
                    [ spacing <| Theme.value theme.modal.iconTextSpacing theme
                    ]
                    [ el [ alignTop ]
                        (iconView <|
                            Theme.value theme.modal.iconColor theme
                        )
                    , column
                        [ width fill
                        , spacing <|
                            Theme.value
                                theme.modal.headerBodySpacing
                                theme
                        ]
                        [ titleView
                        , descriptionView
                        ]
                    ]
                )

        iconView color =
            let
                { alpha, red, green, blue } =
                    toRgb color
            in
            html
                (svg
                    [ viewBox "0 0 20 20"
                    , Svg.width "20"
                    , Svg.fill <|
                        "RGB("
                            ++ (List.map ((*) 255 >> round >> String.fromInt)
                                    [ red, green, blue ]
                                    |> String.join ","
                               )
                            ++ ")"
                    ]
                    [ path [ d """
                                M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0
                                1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 
                                8 0 0 0 11.32 11.32zM9 5h2v6H9V5zm0 
                                8h2v2H9v-2z
                               """ ]
                        []
                    ]
                )

        actionsView =
            el
                [ width fill
                , paddingXY
                    (Theme.value theme.modal.actionsPaddingX theme)
                    (Theme.value theme.modal.actionsPaddingY theme)
                , Background.color <|
                    Theme.value theme.modal.actionsBgColor theme
                ]
                (row
                    [ alignRight
                    , spacing <| Theme.value theme.modal.buttonSpacing theme
                    ]
                    [ buttonView theme
                        { labelText = "Cancel"
                        , buttonType = Secondary
                        }
                    , buttonView theme
                        { labelText = "Deactivate"
                        , buttonType = Danger
                        }
                    ]
                )

        titleView =
            H3.view theme modal.title

        descriptionView =
            BodyText.view theme modal.body
    in
    el
        [ width <| px (Theme.value theme.modal.width theme)
        , Border.widthEach
            { top = Theme.value theme.modal.topHighlightWidth theme
            , left = 0
            , bottom = 0
            , right = 0
            }
        , Border.color <| Theme.value theme.modal.topHighlightColor theme
        , Border.shadow
            (Shadow.shadow
                (Theme.value theme.modal.shadowSpread theme)
                (Theme.value theme.modal.shadowColor theme)
                (Theme.value theme.modal.shadowOpacity theme)
            )
        ]
        (column [ width fill ]
            [ bodyView
            , actionsView
            ]
        )
