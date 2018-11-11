module Main exposing (Model, Msg(..), cards, cardsView, init, main, update, view)

import Browser exposing (Document)
import DesignSystem.Components.BodyText as BodyText exposing (..)
import DesignSystem.Components.Button as Button exposing (..)
import DesignSystem.Components.Card as Card exposing (..)
import DesignSystem.Components.H3 as H3 exposing (..)
import DesignSystem.Components.H4 as H4 exposing (..)
import DesignSystem.Components.Tag as Tag exposing (..)
import DesignSystem.Editor as Editor
import DesignSystem.Layout.Grid exposing (grid)
import DesignSystem.Theme as Theme exposing (Theme)
import DesignSystem.Weight as Weight exposing (Weight)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html, div)
import Palette exposing (Palette, palette)
import Theme exposing (Subthemes, theme)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { theme : Theme Palette Subthemes }


type Msg
    = NoOp


init : () -> ( Model, Cmd Msg )
init flags =
    ( { theme = theme
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


view : Model -> Document Msg
view model =
    let
        theme =
            model.theme
    in
    { title = "Design system"
    , body =
        [ Element.layout
            [ padding (Theme.value theme.page.padding theme)
            , Background.color (Theme.value theme.page.bgColor theme)

            -- , inFront <| Editor.editor theme
            ]
            (el
                [ width fill
                , alignTop
                ]
                (cardsView theme cards)
            )
        ]
    }


cardsView : Theme Palette Subthemes -> List Card -> Element msg
cardsView theme theCards =
    List.map (Card.view theme) theCards
        |> grid 3
            (Theme.value theme.page.cardSpacingX theme)
            (Theme.value theme.page.cardSpacingY theme)


cards : List Card
cards =
    List.repeat 4 dummyCard


dummyCard : Card
dummyCard =
    { category = "Video"
    , thumbnailUrl = "https://upload.wikimedia.org/wikipedia/commons/0/00/Crab_Nebula.jpg"
    , title = "Supernova"
    , description = "An astronomical event that occurs during the last stages of a massive star's life."
    , tags =
        [ { name = "Galaxies", id = 1 }
        , { name = "Milky Way", id = 2 }
        , { name = "Speed of Light", id = 3 }
        ]
    }
