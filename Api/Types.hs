module Api.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data ApiApplication = ApiApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data BonusesController
    = BonusesAction
    | NewBonuseAction
    | ShowBonuseAction { bonuseId :: !(Id Bonuse) }
    | CreateBonuseAction
    | EditBonuseAction { bonuseId :: !(Id Bonuse) }
    | UpdateBonuseAction { bonuseId :: !(Id Bonuse) }
    | DeleteBonuseAction { bonuseId :: !(Id Bonuse) }
    deriving (Eq, Show, Data)
