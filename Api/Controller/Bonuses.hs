module Api.Controller.Bonuses where

import Api.Controller.Prelude
import Api.View.Bonuses.Index
import Api.View.Bonuses.Show
import qualified Network.Wai as Wai
import qualified IHP.Log as Log
import qualified Data.ByteString.Char8 as BS
import qualified Data.Text             as T

instance Controller BonusesController where
    action BonusesAction = do
        let siteId = param @(Id Site) "siteId"
        let siteHost = getHeader "Host" |> fromMaybe ""
        site <- fetch siteId
        putStrLn (get #domain site)
        putStrLn (bst siteHost)
        if (get #domain site) == (bst siteHost)
            then do
                bonuses <- query @Bonuse
                    |> filterWhere (#siteId, siteId)
                    |> fetch
                renderJson (toJSON bonuses)
            else 
                renderPlain "Error Host"

instance ToJSON Bonuse where
    toJSON bonuse = object
        [   "id" .= get #id bonuse
            , "title" .= get #title bonuse
        ]

bst :: BS.ByteString -> T.Text
bst = T.pack . BS.unpack