module Api.Controller.Static where
import Api.Controller.Prelude
import Api.View.Static.Welcome

instance Controller StaticController where
    action WelcomeAction = render WelcomeView
