module Palette exposing (Palette, palette)

import DesignSystem.Weight as Weight exposing (Weight)
import Element exposing (..)
import Element.Font as Font


type alias Palette =
    { color :
        { neutral :
            { l4 : Color
            , l3 : Color
            , l2 : Color
            , l1 : Color
            , base : Color
            , d1 : Color
            , d2 : Color
            , d3 : Color
            }
        , primary : ColorPalette
        , accent : ColorPalette
        , success : ColorPalette
        , warning : ColorPalette
        , danger : ColorPalette
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
            { proximaRegular : List Font.Font
            , proximaBold : List Font.Font
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
    , transition :
        { medium : String
        }
    , misc :
        { thumbnailHeight : Int
        }
    }


type alias ColorPalette =
    { l3 : Color
    , l2 : Color
    , l1 : Color
    , base : Color
    , d1 : Color
    , d2 : Color
    , d3 : Color
    }


palette : Palette
palette =
    { color =
        { neutral =
            { l4 = rgb255 255 255 255
            , l3 = rgb255 248 249 250
            , l2 = rgb255 225 231 237
            , l1 = rgb255 207 214 222
            , base = rgb255 184 196 206
            , d1 = rgb255 136 149 167
            , d2 = rgb255 95 107 122
            , d3 = rgb255 33 41 52
            }
        , primary =
            { l3 = rgb255 240 248 255
            , l2 = rgb255 171 211 245
            , l1 = rgb255 99 162 216
            , base = rgb255 48 131 200
            , d1 = rgb255 36 104 162
            , d2 = rgb255 25 73 113
            , d3 = rgb255 32 61 84
            }
        , accent =
            { l3 = rgb255 231 255 254
            , l2 = rgb255 167 238 235
            , l1 = rgb255 110 216 211
            , base = rgb255 60 175 163
            , d1 = rgb255 41 145 135
            , d2 = rgb255 26 101 94
            , d3 = rgb255 18 69 68
            }
        , success =
            { l3 = rgb255 227 252 236
            , l2 = rgb255 168 238 193
            , l1 = rgb255 116 217 159
            , base = rgb255 57 193 114
            , d1 = rgb255 36 157 88
            , d2 = rgb255 25 119 65
            , d3 = rgb255 20 82 57
            }
        , warning =
            { l3 = rgb255 255 252 244
            , l2 = rgb255 253 243 215
            , l1 = rgb255 250 226 159
            , base = rgb255 244 202 100
            , d1 = rgb255 202 165 61
            , d2 = rgb255 140 109 32
            , d3 = rgb255 92 72 19
            }
        , danger =
            { l3 = rgb255 252 232 232
            , l2 = rgb255 246 170 170
            , l1 = rgb255 228 101 100
            , base = rgb255 220 48 48
            , d1 = rgb255 184 32 32
            , d2 = rgb255 137 27 27
            , d3 = rgb255 96 25 24
            }
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
            { proximaRegular =
                [ Font.typeface "Proxima Nova W05 Regular"
                , Font.sansSerif
                ]
            , proximaBold =
                [ Font.typeface "Proxima Nova W05 Bold"
                , Font.sansSerif
                ]
            }
        , size =
            { s = 15
            , m = 18
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
    , transition =
        { medium = "0.1s ease-in-out"
        }
    , misc =
        { thumbnailHeight = 200
        }
    }
