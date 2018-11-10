module DesignSystem.Tokens.Color exposing (defaultColorTokens)

import DesignSystem.Tokens exposing (..)
import Dict
import Element exposing (Color, rgb255)


defaultColorTokens : Mappings Element.Color -> Tokens Element.Color
defaultColorTokens mappings =
    let
        mappingsLookup =
            Dict.fromList
                mappings

        valuesLookup =
            Dict.fromList
                [ ( "black", rgb255 41 41 41 )
                , ( "gray-d3", rgb255 71 71 71 )
                , ( "gray-d2", rgb255 102 102 102 )
                , ( "gray-d1", rgb255 184 184 184 )
                , ( "gray", rgb255 210 210 210 )
                , ( "gray-l1", rgb255 228 228 228 )
                , ( "gray-l2", rgb255 240 240 240 )
                , ( "gray-l3", rgb255 250 250 250 )
                , ( "white", rgb255 255 255 255 )
                , ( "primary", rgb255 69 107 161 )
                , ( "secondary", rgb255 84 94 106 )
                , ( "success", rgb255 92 25 172 )
                , ( "warning", rgb255 219 227 117 )
                , ( "error", rgb255 214 49 117 )
                , ( "highlight", rgb255 223 245 247 )
                ]
    in
    Tokens mappingsLookup valuesLookup
