module DesignSystem.Layout.InlineContainer exposing (inlineContainer)

import Element exposing (..)
import Html.Attributes exposing (style)


inlineContainer : List (Element msg) -> Int -> Int -> Element msg
inlineContainer items spacingX spacingY =
    let
        parentAttributes =
            [ style "margin-bottom" ((String.fromInt <| spacingY * -1) ++ "px") |> htmlAttribute
            , style "width" "100%" |> htmlAttribute
            ]

        childAttributes =
            [ style "display" "inline-block" |> htmlAttribute
            , style "margin-right" (String.fromInt spacingX ++ "px") |> htmlAttribute
            , style "margin-bottom" (String.fromInt spacingY ++ "px") |> htmlAttribute
            ]
    in
    paragraph (parentAttributes ++ [ width fill ])
        (List.map (el childAttributes) items)
