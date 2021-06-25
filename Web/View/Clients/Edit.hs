module Web.View.Clients.Edit where
import Web.View.Prelude

data EditView = EditView { client :: Client }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClientsAction}>Clients</a></li>
                <li class="breadcrumb-item active">Edit Client</li>
            </ol>
        </nav>
        <h1>Edit Client</h1>
        {renderForm client}
    |]

renderForm :: Client -> Html
renderForm client = formFor client [hsx|
    {(textField #bonuseId)}
    {(textField #phone)}
    {submitButton}
|]
