module DesignSystem.Values.Shadow exposing (Shadow, Spread, shadow)

import Element exposing (Color)


type alias Spread =
    { offset : ( Float, Float )
    , size : Float
    , blur : Float
    }


type alias Shadow =
    { offset : ( Float, Float )
    , size : Float
    , blur : Float
    , color : Color
    }


shadow : Spread -> Color -> Float -> Shadow
shadow spread color alpha =
    let
        { red, green, blue } =
            Element.toRgb color
                |> (\c ->
                        { red = c.red * 255 |> round
                        , green = c.green * 255 |> round
                        , blue = c.blue * 255 |> round
                        }
                   )
    in
    { offset = spread.offset
    , size = spread.size
    , blur = spread.blur
    , color = Element.rgba255 red green blue alpha
    }
