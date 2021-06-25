module Web.View.Clients.Show where
import Web.View.Prelude

data ShowView = ShowView { client :: Client }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClientsAction}>Clients</a></li>
                <li class="breadcrumb-item active">Show Client</li>
            </ol>
        </nav>
        <h1>Show Client</h1>
        <p>{client}</p>
    |]
