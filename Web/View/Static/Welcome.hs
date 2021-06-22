module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
         <div style="background-color: #657b83; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1); border-radius: 4px">
              <div style="max-width: 800px; margin-left: auto; margin-right: auto">
                  <h1 style="margin-bottom: 2rem; font-size: 2rem; font-weight: 300; border-bottom: 1px solid white; padding-bottom: 0.25rem; border-color: hsla(196, 13%, 60%, 1)">
                      Traffic Catcher
                  </h1>

                  <h2 style="margin-top: 0; margin-bottom: 0rem; font-weight: 900; font-size: 3rem">
                      It's working!!!
                  </h2>
                  <h1 class="elm">
                    Elm is not working... :(
                  </h1>

                  
              </div>
         </div>

         <div style="max-width: 800px; margin-left: auto; margin-right: auto; margin-top: 4rem">
              <img src="/ihp-welcome-icon.svg" alt="/ihp-welcome-icon">
              <p style="color: hsla(196, 13%, 50%, 1); margin-top: 4rem">
                 You can modify this start page by making changes to "./Web/View/Static/Welcome.hs".
              </p>
         </div> 
|]