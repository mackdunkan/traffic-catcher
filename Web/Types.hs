module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types
import IHP.LoginSupport.Types

data WebApplication = WebApplication deriving (Eq, Show)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

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
    = NewBonuseAction { siteId :: !(Id Site) }
    | ShowBonuseAction { bonuseId :: !(Id Bonuse) }
    | CreateBonuseAction
    | EditBonuseAction { bonuseId :: !(Id Bonuse) }
    | UpdateBonuseAction { bonuseId :: !(Id Bonuse) }
    | DeleteBonuseAction { bonuseId :: !(Id Bonuse) }
    deriving (Eq, Show, Data)
