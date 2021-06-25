module Web.View.Clients.New where
import Web.View.Prelude

data NewView = NewView { client :: Client }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClientsAction}>Clients</a></li>
                <li class="breadcrumb-item active">New Client</li>
            </ol>
        </nav>
        <h1>New Client</h1>
        {renderForm client}
    |]

renderForm :: Client -> Html
renderForm client = formFor client [hsx|
    {(textField #bonuseId)}
    {(textField #phone)}
    {submitButton}
|]
