module Api.FrontController where

import IHP.RouterPrelude
import Api.Controller.Prelude
import Api.View.Layout (defaultLayout)

-- Controller Imports
import Api.Controller.Bonuses
import Api.Controller.Static

instance FrontController ApiApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @BonusesController
        ]

instance InitControllerContext ApiApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
