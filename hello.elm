import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (..)

type alias Model = { quantity: Int, name: String }
type Msg = Reset | Add(Int) | Sub | Multiply(Int)


emptyModel = { quantity = 0, name = "john doe?" }


css path =  node "link" [ rel "stylesheet", href path ] []


--view: Model -> Html Msg
view model =
    div [ class "Page" ] [
        css "styles.css",
        button [ class "AddButton", onClick (Add 5) ] [text "Add five!"],
        button [ class "SubButton", onClick Sub ] [text "Sub one"],
        button [ onClick (Multiply 2) ] [text "Multiply"],
        br [] [], br [] [],
        text ("Done! Current quantity is " ++ toString(model.quantity) ++ " for " ++ model.name)
    ]

update: Msg -> Model -> Model
update msg model =
    case msg of
        Reset -> { model | quantity = 0 }
        Add(quantity) -> { model | quantity = model.quantity + quantity }
        Sub -> { model | quantity = model.quantity - 1 }
        Multiply(quantity) -> { model | quantity = model.quantity * quantity }

main = Html.App.beginnerProgram
    {
        model = emptyModel,
        view = view,
        update = update
    }