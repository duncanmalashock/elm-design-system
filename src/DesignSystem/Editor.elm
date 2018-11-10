module DesignSystem.Editor exposing (editor)

import DesignSystem.Theme as Theme exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font


editor : Theme -> Element msg
editor theme =
    el
        [ width (px 300)
        , Background.color (rgb255 240 240 240)
        , paddingXY 20 20
        , alignRight
        ]
        (text "hi!")
