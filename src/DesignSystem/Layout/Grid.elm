module DesignSystem.Layout.Grid exposing (grid)

import Element exposing (..)
import Html.Attributes exposing (style)


grid : Int -> Int -> Int -> List (Element msg) -> Element msg
grid numPerRow spacingX spacingY items =
    let
        gridTemplateColumns =
            "repeat(" ++ String.fromInt numPerRow ++ ", 1fr)"

        gridColumnGap =
            String.fromInt spacingX ++ "px"

        gridRowGap =
            String.fromInt spacingY ++ "px"

        griddedItems =
            List.map
                (el
                    []
                )
                items
    in
    row
        [ style "display" "grid" |> htmlAttribute
        , style "grid-template-columns" gridTemplateColumns |> htmlAttribute
        , style "align-items" "center" |> htmlAttribute
        , style "grid-row-gap" gridRowGap |> htmlAttribute
        , style "grid-column-gap" gridColumnGap |> htmlAttribute
        ]
        griddedItems
