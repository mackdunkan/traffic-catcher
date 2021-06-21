module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data SitesController
    = SitesAction
    | NewSiteAction
    | ShowSiteAction { siteId :: !(Id Site) }
    | CreateSiteAction
    | EditSiteAction { siteId :: !(Id Site) }
    | UpdateSiteAction { siteId :: !(Id Site) }
    | DeleteSiteAction { siteId :: !(Id Site) }
    deriving (Eq, Show, Data)



data BonusesController
    = BonusesAction
    | NewBonuseAction { siteId :: !(Id Site) }
    | ShowBonuseAction { bonuseId :: !(Id Bonuse) }
    | CreateBonuseAction
    | EditBonuseAction { bonuseId :: !(Id Bonuse) }
    | UpdateBonuseAction { bonuseId :: !(Id Bonuse) }
    | DeleteBonuseAction { bonuseId :: !(Id Bonuse) }
    deriving (Eq, Show, Data)
