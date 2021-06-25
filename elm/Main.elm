module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Http
import Json.Decode as Decode exposing (Decoder, int, list, string)
import Json.Decode.Pipeline exposing (required)
import RemoteData exposing (RemoteData, WebData)
import Random



type alias Bonuse =
    { id : String
    , title : String
    }


type alias Model =
    { bonuses : WebData (List Bonuse)
    , winner : Int
    }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick SendHttpRequest ]
            [ text "Получить бонусы" ]
        , viewPostsOrError model
        ]


viewPostsOrError : Model -> Html Msg
viewPostsOrError model =
    case model.bonuses of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            h3 [] [ text "Загрузка..." ]

        RemoteData.Success posts ->
            viewPosts posts

        RemoteData.Failure httpError ->
            viewError (buildErrorMessage httpError)


viewError : String -> Html Msg
viewError errorMessage =
    let
        errorHeading =
            "Couldn't fetch data at this time."
    in
    div []
        [ h3 [] [ text errorHeading ]
        , text ("Error: " ++ errorMessage)
        ]


viewPosts : List Bonuse -> Html Msg
viewPosts posts =
    div []
        [ h3 [] [ text "Бонусы" ]
        , table []
            ([ viewTableHeader ] ++ List.map viewPost posts)
        , div [] [
            button [ onClick Roll ] [ text "Старт"]
        ]
        ]


viewTableHeader : Html Msg
viewTableHeader =
    tr []
        [ th []
            [ text "ID" ]
        , th []
            [ text "Title" ]
        ]


viewPost : Bonuse -> Html Msg
viewPost bonuse =
    tr []
        [ td []
            [ text bonuse.id ]
        , td []
            [ text bonuse.title ]
        ]


type Msg
    = SendHttpRequest
    | DataReceived (WebData (List Bonuse))
    | Roll
    | WinnerBonus Int


postDecoder : Decoder Bonuse
postDecoder =
    Decode.succeed Bonuse
        |> required "id" string
        |> required "title" string



httpCommand : Cmd Msg
httpCommand =
    Http.request
        { method = "GET"
                , headers = [ Http.header "Accept" "application/json" ]
                , url = "/api/Bonuses?siteId=a6e96d3d-cac1-4c68-a492-ffca9b78fe0b"
                , body = Http.emptyBody
                , expect =
                      list postDecoder
                          |> Http.expectJson (RemoteData.fromResult >> DataReceived)
                , timeout = Nothing
                , tracker = Nothing

                }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SendHttpRequest ->
            ( { model | bonuses = RemoteData.Loading }, httpCommand )

        DataReceived response ->
            ( { model | bonuses = response }, Cmd.none )

        Roll ->
            (model, Random.generate WinnerBonus (Random.int 1 6))
        
        WinnerBonus winnerBonus ->
            ( { model | winner = winnerBonus }, Cmd.none )


buildErrorMessage : Http.Error -> String
buildErrorMessage httpError =
    case httpError of
        Http.BadUrl message ->
            message

        Http.Timeout ->
            "Server is taking too long to respond. Please try again later."

        Http.NetworkError ->
            "Unable to reach server."

        Http.BadStatus statusCode ->
            "Request failed with status code: " ++ String.fromInt statusCode

        Http.BadBody message ->
            message


init : () -> ( Model, Cmd Msg )
init _ =
    ( { bonuses = RemoteData.NotAsked
        , winner = 0 }, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }

