module Web.View.Sites.Edit where
import Web.View.Prelude

data EditView = EditView { site :: Site }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SitesAction}>Sites</a></li>
                <li class="breadcrumb-item active">Edit Site</li>
            </ol>
        </nav>
        <h1>Edit Site</h1>
        {renderForm site}
    |]

renderForm :: Site -> Html
renderForm site = formFor site [hsx|
    {(textField #domain)}
    {submitButton}
|]
