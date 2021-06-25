module Api.Controller.Clients where

import Api.Controller.Prelude
import Api.View.Clients.New
import qualified Data.UUID             as Data

instance Controller ClientsController where
    action CreateClientAction = do
        let siteId = param @(Id Site) "siteId"
        let bonuseId = param @(Id Bonuse) "bonuseId"
        let phone = param @Text "phone"
        let name = param @Text "name"
        let client = newRecord @Client
        client
            |> buildClient
            |> ifValid \case
                Left client -> renderPlain "Error Created Client"
                Right client -> do
                    client <- client
                        |> set #bonuseId bonuseId
                        |> set #phone phone
                        |> set #name name
                        |> createRecord
                    renderJson (toJSON client)

buildClient client = client
    |> fill @["bonuseId","phone"]

instance ToJSON Client where
    toJSON client = object
        [   "name" .= get #name client
            , "phone" .= get #phone client
        ]