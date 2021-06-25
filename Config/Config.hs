module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import qualified Network.Wai.Middleware.Cors as Cors

config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option Cors.simpleCorsResourcePolicy { Cors.corsOrigins = Nothing }