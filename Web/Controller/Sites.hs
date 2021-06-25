module Web.Controller.Sites where

import Web.Controller.Prelude
import Web.View.Sites.Index
import Web.View.Sites.New
import Web.View.Sites.Edit
import Web.View.Sites.Show

instance Controller SitesController where
    beforeAction = ensureIsUser
    
    action SitesAction = do
        sites <- query @Site 
            |> filterWhere (#userId, currentUserId) 
            |> fetch
        render IndexView { .. }

    action NewSiteAction = do
        let site = newRecord
                |> set #userId currentUserId
        user <- fetch currentUserId
        render NewView { .. }

    action ShowSiteAction { siteId } = do
        site <- fetch siteId
            >>= fetchRelated #bonuses
        clients <- query @Client
            |> filterWhereIn (#bonuseId, ids (get #bonuses site))
            |> fetch
        render ShowView { .. }

    action EditSiteAction { siteId } = do
        site <- fetch siteId
        render EditView { .. }

    action UpdateSiteAction { siteId } = do
        site <- fetch siteId
        site
            |> buildSite
            |> ifValid \case
                Left site -> render EditView { .. }
                Right site -> do
                    site <- site |> updateRecord
                    setSuccessMessage "Site updated"
                    redirectTo EditSiteAction { .. }

    action CreateSiteAction = do
        let site = newRecord @Site
        site
            |> buildSite
            |> ifValid \case
                Left site -> do
                    user <- fetch (get #userId site)
                    render NewView { .. } 
                Right site -> do
                    site <- site |> createRecord
                    setSuccessMessage "Site created"
                    redirectTo SitesAction

    action DeleteSiteAction { siteId } = do
        site <- fetch siteId
        deleteRecord site
        setSuccessMessage "Site deleted"
        redirectTo SitesAction

buildSite site = site
    |> fill @'["userId", "domain"]
    |> validateField #domain nonEmpty
