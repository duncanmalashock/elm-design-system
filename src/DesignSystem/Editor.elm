module DesignSystem.Editor exposing (editor)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


editor : Element msg
editor =
    el
        [ width (px 300)
        , Background.color (rgb255 240 240 240)
        , paddingXY 20 20
        , alignRight
        ]
        (text "hi!")
