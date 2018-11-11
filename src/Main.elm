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
    ( { theme = myTheme
      }
    , Cmd.none
    )


type alias Palette =
    { color :
        { grayL3 : Color
        , grayL2 : Color
        , grayL1 : Color
        , grayBase : Color
        , grayD1 : Color
        , grayD2 : Color
        , grayD3 : Color
        , primaryBase : Color
        }
    , space :
        { xs : Int
        , s : Int
        , m : Int
        , l : Int
        , xl : Int
        }
    , font :
        { face :
            { lato : List Font.Font
            }
        , size :
            { s : Int
            , m : Int
            , l : Int
            }
        , weight :
            { medium : Weight
            , bold : Weight
            , extraBold : Weight
            }
        , tracking :
            { wide : Float
            , normal : Float
            }
        }
    , borderRadius :
        { tight : Int
        }
    , misc :
        { thumbnailHeight : Int
        }
    }


myPalette : Palette
myPalette =
    { color =
        { grayL3 = rgb255 255 255 255
        , grayL2 = rgb255 226 228 234
        , grayL1 = rgb255 196 201 212
        , grayBase = rgb255 124 135 160
        , grayD1 = rgb255 90 97 118
        , grayD2 = rgb255 42 47 60
        , grayD3 = rgb255 32 36 44
        , primaryBase = rgb255 46 104 160
        }
    , space =
        { xs = 4
        , s = 8
        , m = 16
        , l = 32
        , xl = 64
        }
    , font =
        { face =
            { lato =
                [ Font.typeface "Lato"
                , Font.sansSerif
                ]
            }
        , size =
            { s = 15
            , m = 17
            , l = 22
            }
        , weight =
            { medium = Weight.Medium
            , bold = Weight.Bold
            , extraBold = Weight.ExtraBold
            }
        , tracking =
            { wide = 0.75
            , normal = 0.0
            }
        }
    , borderRadius =
        { tight = 4
        }
    , misc =
        { thumbnailHeight = 200
        }
    }


myTheme : Theme Palette Subthemes
myTheme =
    { palette = myPalette
    , page =
        { padding = .space >> .xl
        , bgColor = .color >> .grayD2
        , cardSpacingX = .space >> .l
        , cardSpacingY = .space >> .l
        }
    , card =
        { bgColor = .color >> .grayL2
        , paddingX = .space >> .m
        , paddingY = .space >> .m
        , contentSpacing = .space >> .m
        , headerSpacing = .space >> .xs
        , thumbnailHeight = .misc >> .thumbnailHeight
        , tagsSpacingX = .space >> .s
        , tagsSpacingY = .space >> .s
        }
    , button =
        { primaryBgColor = .color >> .primaryBase
        , paddingX = .space >> .l
        , paddingY = .space >> .m
        , borderRadius = .borderRadius >> .tight
        , typeFace = .font >> .face >> .lato
        , typeSize = .font >> .size >> .m
        , textColor = .color >> .grayL3
        , typeWeight = .font >> .weight >> .bold
        }
    , bodyText =
        { typeFace = .font >> .face >> .lato
        , typeSize = .font >> .size >> .s
        , textColor = .color >> .grayD1
        }
    , h3 =
        { typeFace = .font >> .face >> .lato
        , typeSize = .font >> .size >> .s
        , textColor = .color >> .grayBase
        , typeWeight = .font >> .weight >> .extraBold
        , typeTracking = .font >> .tracking >> .wide
        }
    , h4 =
        { typeFace = .font >> .face >> .lato
        , typeSize = .font >> .size >> .l
        , textColor = .color >> .grayD3
        , typeWeight = .font >> .weight >> .bold
        , typeTracking = .font >> .tracking >> .normal
        }
    , tag =
        { bgColor = .color >> .grayL1
        , paddingX = .space >> .s
        , paddingY = .space >> .s
        , textColor = .color >> .grayD3
        , typeFace = .font >> .face >> .lato
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

            -- , inFront <| Editor.editor myTheme
            ]
            (el
                [ width fill
                , alignTop
                ]
                (cardsView myTheme cards)
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
