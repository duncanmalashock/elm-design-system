module DesignSystem.Theme exposing (Theme, value)


type alias Theme palette subthemes =
    { subthemes
        | palette : palette
    }


value : (palette -> a) -> Theme palette subthemes -> a
value getter theme =
    getter theme.palette
