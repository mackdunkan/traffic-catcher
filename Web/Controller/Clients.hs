module Web.Controller.Clients where

import Web.Controller.Prelude
import Web.View.Clients.Index
import Web.View.Clients.New
import Web.View.Clients.Edit
import Web.View.Clients.Show

instance Controller ClientsController where
    action ClientsAction = do
        clients <- query @Client |> fetch
        render IndexView { .. }

    action NewClientAction = do
        let client = newRecord
        render NewView { .. }

    action ShowClientAction { clientId } = do
        client <- fetch clientId
        render ShowView { .. }

    action EditClientAction { clientId } = do
        client <- fetch clientId
        render EditView { .. }

    action UpdateClientAction { clientId } = do
        client <- fetch clientId
        client
            |> buildClient
            |> ifValid \case
                Left client -> render EditView { .. }
                Right client -> do
                    client <- client |> updateRecord
                    setSuccessMessage "Client updated"
                    redirectTo EditClientAction { .. }

    action CreateClientAction = do
        let client = newRecord @Client
        client
            |> buildClient
            |> ifValid \case
                Left client -> render NewView { .. } 
                Right client -> do
                    client <- client |> createRecord
                    setSuccessMessage "Client created"
                    redirectTo ClientsAction

    action DeleteClientAction { clientId } = do
        client <- fetch clientId
        deleteRecord client
        setSuccessMessage "Client deleted"
        redirectTo ClientsAction

buildClient client = client
    |> fill @["bonuseId","phone"]
