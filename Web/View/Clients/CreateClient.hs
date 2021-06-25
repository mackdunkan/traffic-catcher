module Web.View.Clients.CreateClient where
import Web.View.Prelude

data CreateClientView = CreateClientView

instance View CreateClientView where
    html CreateClientView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClientsAction}>CreateClients</a></li>
                <li class="breadcrumb-item active">CreateClientView</li>
            </ol>
        </nav>
        <h1>CreateClientView</h1>
    |]
