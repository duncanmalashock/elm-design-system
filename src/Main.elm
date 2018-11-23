module Main exposing (Model, Msg(..), init, main, update, view)

import Browser exposing (Document)
import DesignSystem.Components.BodyText as BodyText exposing (..)
import DesignSystem.Components.Button as Button exposing (..)
import DesignSystem.Components.Card as Card exposing (..)
import DesignSystem.Components.H3 as H3 exposing (..)
import DesignSystem.Components.H4 as H4 exposing (..)
import DesignSystem.Components.Modal as Modal exposing (..)
import DesignSystem.Components.Tag as Tag exposing (..)
import DesignSystem.Editor as Editor
import DesignSystem.Layout.Grid exposing (grid)
import DesignSystem.Theme as Theme exposing (Theme)
import DesignSystem.Values.Weight as Weight exposing (Weight)
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
            [ Background.color (Theme.value theme.page.bgColor theme)
            ]
            (el
                [ centerX
                , centerY
                ]
                (Modal.view theme modal)
            )
        ]
    }


modal =
    { title = "Deactivate account"
    , body = "Are you sure you want to deactivate your account? By doing this you will lose all of your saved data and will not be able to retrieve it."
    , cancelButton = "Cancel"
    , confirmButton = "Deactivate"
    }
