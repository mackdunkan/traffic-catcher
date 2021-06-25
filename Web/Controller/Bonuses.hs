module Web.Controller.Bonuses where

import Web.Controller.Prelude
import Web.View.Bonuses.Index
import Web.View.Bonuses.New
import Web.View.Bonuses.Edit
import Web.View.Bonuses.Show

instance Controller BonusesController where
    beforeAction = ensureIsUser

    action BonusesAction = do
        redirectTo SitesAction
    
    action NewBonuseAction { siteId } = do
        let bonuse = newRecord
                |> set #siteId siteId
        site <- fetch siteId
        render NewView { .. }

    action ShowBonuseAction { bonuseId } = do
        bonuse <- fetch bonuseId
        render ShowView { .. }

    action EditBonuseAction { bonuseId } = do
        bonuse <- fetch bonuseId
        render EditView { .. }

    action UpdateBonuseAction { bonuseId } = do
        bonuse <- fetch bonuseId
        bonuse
            |> buildBonuse
            |> ifValid \case
                Left bonuse -> render EditView { .. }
                Right bonuse -> do
                    bonuse <- bonuse |> updateRecord
                    setSuccessMessage "Bonuse updated"
                    redirectTo EditBonuseAction { .. }

    action CreateBonuseAction = do
        let bonuse = newRecord @Bonuse
        bonuse
            |> buildBonuse
            |> ifValid \case
                Left bonuse -> do 
                    site <- fetch (get #siteId bonuse)
                    render NewView { .. } 
                Right bonuse -> do
                    bonuse <- bonuse |> createRecord
                    setSuccessMessage "Bonuse created"
                    redirectTo ShowSiteAction {siteId = get #siteId bonuse}

    action DeleteBonuseAction { bonuseId } = do
        bonuse <- fetch bonuseId
        deleteRecord bonuse
        setSuccessMessage "Bonuse deleted"
        redirectTo ShowSiteAction {siteId = get #siteId bonuse}

buildBonuse bonuse = bonuse
    |> fill @["siteId","title"]
