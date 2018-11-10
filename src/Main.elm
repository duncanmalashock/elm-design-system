module Main exposing (Model, Msg(..), cards, cardsView, init, main, pageThemeMappings, update, view)

import Browser exposing (Document)
import DesignSystem.Components.Button as Button
import DesignSystem.Components.Card as Card exposing (..)
import DesignSystem.Components.Headers as Headers exposing (..)
import DesignSystem.Components.Tag as Tag
import DesignSystem.Editor as Editor
import DesignSystem.Layout.Grid exposing (grid)
import DesignSystem.Theme as Theme exposing (..)
import DesignSystem.Tokens as Tokens exposing (..)
import Element exposing (..)
import Element.Background as Background
import Html exposing (Html, div)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { theme : Theme }


type Msg
    = UpdateSpaceMapping String
    | UpdateTypeFaceValue String


init : () -> ( Model, Cmd Msg )
init flags =
    ( { theme =
            Theme.defaultWithMappings
                [ pageThemeMappings
                , Button.defaultThemeMappings
                , Card.defaultThemeMappings
                , Headers.header3DefaultThemeMappings
                , Headers.header4DefaultThemeMappings
                , Headers.bodyTextDefaultThemeMappings
                , Tag.defaultThemeMappings
                ]
      }
    , Cmd.none
    )


pageThemeMappings : ThemeMappings
pageThemeMappings =
    { colors =
        [ ( "pageBg", mapToKey "gray-d3" )
        ]
    , spaces =
        [ ( "pagePadding", mapToKey "xl" )
        ]
    , typeSizes = []
    , typeFaces = []
    , typeWeights = []
    , typeTrackings = []
    , borderRadii = []
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateSpaceMapping newValue ->
            let
                theme =
                    model.theme

                updatedTheme =
                    { theme
                        | spaces =
                            theme.spaces
                                |> Tokens.setMapping "primaryButtonPaddingX" (mapToKey newValue)
                    }
            in
            ( { model | theme = updatedTheme }
            , Cmd.none
            )

        UpdateTypeFaceValue newValue ->
            let
                theme =
                    model.theme

                updatedTheme =
                    { theme
                        | typeFaces =
                            theme.typeFaces
                                |> Tokens.setValue "sans1" [ newValue ]
                    }
            in
            ( { model | theme = updatedTheme }
            , Cmd.none
            )


view : Model -> Document Msg
view model =
    let
        theme =
            model.theme
    in
    { title = "Design system"
    , body =
        [ Element.layout
            [ padding (spaceFor theme "pagePadding")
            , Background.color (colorFor theme "pageBg")
            , inFront <| Editor.editor theme
            ]
            (el
                [ width fill
                , alignTop
                ]
                (cardsView theme cards)
            )
        ]
    }


cardsView : Theme -> List Card -> Element msg
cardsView theme theCards =
    List.map (cardView theme) theCards
        |> grid 3
            (spaceFor theme "cardsSpacingX")
            (spaceFor theme "cardsSpacingY")


cards : List Card
cards =
    List.repeat 4 dummyCard
