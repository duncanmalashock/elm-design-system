module DesignSystem.Components.Card exposing
    ( Card
    , Theme
    , view
    )

import DesignSystem.Components.BodyText as BodyText exposing (..)
import DesignSystem.Components.Button as Button exposing (..)
import DesignSystem.Components.H3 as H3 exposing (..)
import DesignSystem.Components.H4 as H4 exposing (..)
import DesignSystem.Components.Tag as Tag exposing (..)
import DesignSystem.Layout.InlineContainer exposing (inlineContainer)
import DesignSystem.Theme as Theme
import Element exposing (..)
import Element.Background as Background


type alias Card =
    { category : String
    , thumbnailUrl : String
    , title : String
    , description : String
    , tags : List Tag
    }


type alias Theme palette =
    { bgColor : palette -> Color
    , paddingX : palette -> Int
    , paddingY : palette -> Int
    , contentSpacing : palette -> Int
    , headerSpacing : palette -> Int
    , thumbnailHeight : palette -> Int
    , tagsSpacingX : palette -> Int
    , tagsSpacingY : palette -> Int
    }


view :
    Theme.Theme palette
        { a
            | card : Theme palette
            , button : Button.Theme palette
            , h3 : H3.Theme palette
            , h4 : H4.Theme palette
            , tag : Tag.Theme palette
            , bodyText : BodyText.Theme palette
        }
    -> Card
    -> Element msg
view theme card =
    let
        thumbnailView =
            el
                [ width fill
                , height (px <| Theme.value theme.card.thumbnailHeight theme)
                , Background.color <| Theme.value theme.card.bgColor theme
                , Background.image card.thumbnailUrl
                ]
                none

        bodyView =
            el
                [ width fill
                , Background.color <| Theme.value theme.card.bgColor theme
                , paddingXY
                    (Theme.value theme.card.paddingX theme)
                    (Theme.value theme.card.paddingY theme)
                ]
                (column [ spacing (Theme.value theme.card.contentSpacing theme) ]
                    [ column [ spacing (Theme.value theme.card.headerSpacing theme) ]
                        [ categoryView
                        , titleView
                        ]
                    , descriptionView
                    , tagsView
                    , buttonView theme "View"
                    ]
                )

        categoryView =
            H3.view theme card.category

        titleView =
            H4.view theme card.title

        descriptionView =
            BodyText.view theme card.description

        tagsView =
            inlineContainer (List.map (Tag.view theme) card.tags)
                (Theme.value theme.card.tagsSpacingX theme)
                (Theme.value theme.card.tagsSpacingY theme)
    in
    column [ width fill ]
        [ thumbnailView
        , bodyView
        ]
