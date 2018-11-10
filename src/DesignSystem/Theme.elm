module DesignSystem.Theme exposing
    ( Theme
    , ThemeMappings
    , borderRadiusFor
    , colorFor
    , defaultWithMappings
    , spaceFor
    , typeFaceFor
    , typeSizeFor
    , typeTrackingFor
    , typeWeightFor
    )

import DesignSystem.Tokens exposing (Mappings, Tokens(..), valueForKey)
import DesignSystem.Tokens.Border.Radius exposing (defaultBorderRadiusTokens)
import DesignSystem.Tokens.Color exposing (defaultColorTokens)
import DesignSystem.Tokens.Space exposing (defaultSpaceTokens)
import DesignSystem.Tokens.Typography.Face exposing (defaultTypeFaceTokens)
import DesignSystem.Tokens.Typography.Size exposing (defaultTypeSizeTokens)
import DesignSystem.Tokens.Typography.Tracking exposing (defaultTypeTrackingTokens)
import DesignSystem.Tokens.Typography.Weight as Weight exposing (Weight(..), defaultTypeWeightTokens)
import Element exposing (Color, rgb255)
import Element.Font


type alias Theme =
    { colors : Tokens Color
    , spaces : Tokens Int
    , typeSizes : Tokens Int
    , typeFaces : Tokens (List String)
    , typeWeights : Tokens Weight
    , typeTrackings : Tokens Float
    , borderRadii : Tokens Int
    }


type alias ThemeMappings =
    { colors : Mappings Color
    , spaces : Mappings Int
    , typeSizes : Mappings Int
    , typeFaces : Mappings (List String)
    , typeWeights : Mappings Weight
    , typeTrackings : Mappings Float
    , borderRadii : Mappings Int
    }



-- TODO
-- , borderWidths : Tokens Int
-- , shadows : Tokens Shadow


emptyMappings : ThemeMappings
emptyMappings =
    { colors = []
    , spaces = []
    , typeSizes = []
    , typeFaces = []
    , typeWeights = []
    , typeTrackings = []
    , borderRadii = []
    }


concatenateMappings : ThemeMappings -> ThemeMappings -> ThemeMappings
concatenateMappings currentMappings newMappings =
    { currentMappings
        | colors = currentMappings.colors ++ newMappings.colors
        , spaces = currentMappings.spaces ++ newMappings.spaces
        , typeSizes = currentMappings.typeSizes ++ newMappings.typeSizes
        , typeFaces = currentMappings.typeFaces ++ newMappings.typeFaces
        , typeWeights = currentMappings.typeWeights ++ newMappings.typeWeights
        , typeTrackings = currentMappings.typeTrackings ++ newMappings.typeTrackings
        , borderRadii = currentMappings.borderRadii ++ newMappings.borderRadii
    }


defaultWithMappings : List ThemeMappings -> Theme
defaultWithMappings mappingsList =
    let
        combinedMappings =
            List.foldl concatenateMappings emptyMappings mappingsList
    in
    { colors = defaultColorTokens combinedMappings.colors
    , spaces = defaultSpaceTokens combinedMappings.spaces
    , typeSizes = defaultTypeSizeTokens combinedMappings.typeSizes
    , typeFaces = defaultTypeFaceTokens combinedMappings.typeFaces
    , typeWeights = defaultTypeWeightTokens combinedMappings.typeWeights
    , typeTrackings = defaultTypeTrackingTokens combinedMappings.typeTrackings
    , borderRadii = defaultBorderRadiusTokens combinedMappings.borderRadii
    }


errorColor : Color
errorColor =
    rgb255 255 132 0


colorFor : Theme -> String -> Color
colorFor theme key =
    valueForKey theme.colors errorColor key


errorSpace : Int
errorSpace =
    420


spaceFor : Theme -> String -> Int
spaceFor theme key =
    valueForKey theme.spaces errorSpace key


errorTypeSize : Int
errorTypeSize =
    666


typeSizeFor : Theme -> String -> Int
typeSizeFor theme key =
    valueForKey theme.typeSizes errorTypeSize key


errorTypeFace : List String
errorTypeFace =
    [ "Wingdings", "Zapf Dingbats" ]


typeFaceFor : Theme -> String -> List Element.Font.Font
typeFaceFor theme key =
    valueForKey theme.typeFaces errorTypeFace key
        |> List.map Element.Font.typeface


errorTypeWeight : Weight
errorTypeWeight =
    Heavy


typeWeightFor : Theme -> String -> Element.Attribute msg
typeWeightFor theme key =
    valueForKey theme.typeWeights errorTypeWeight key
        |> Weight.toAttribute


errorTypeTracking : Float
errorTypeTracking =
    10.0


typeTrackingFor : Theme -> String -> Float
typeTrackingFor theme key =
    valueForKey theme.typeTrackings errorTypeTracking key


errorBorderRadius : Int
errorBorderRadius =
    666


borderRadiusFor : Theme -> String -> Int
borderRadiusFor theme key =
    valueForKey theme.borderRadii errorBorderRadius key
