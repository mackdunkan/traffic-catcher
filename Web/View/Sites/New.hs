module Web.View.Sites.New where
import Web.View.Prelude

data NewView = NewView { site :: Site
                        , user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SitesAction}>Sites</a></li>
                <li class="breadcrumb-item active">New Site</li>
            </ol>
        </nav>
        <h1>New Site</h1>
        {renderForm site}
    |]

renderForm :: Site -> Html
renderForm site = formFor site [hsx|
    {hiddenField  #userId}
    {(textField #domain)}
    {submitButton}
|]
