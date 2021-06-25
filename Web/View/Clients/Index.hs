module Web.View.Clients.Index where
import Web.View.Prelude

data IndexView = IndexView { clients :: [Client] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ClientsAction}>Clients</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewClientAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Client</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach clients renderClient}</tbody>
            </table>
        </div>
    |]


renderClient :: Client -> Html
renderClient client = [hsx|
    <tr>
        <td>{client}</td>
        <td><a href={ShowClientAction (get #id client)}>Show</a></td>
        <td><a href={EditClientAction (get #id client)} class="text-muted">Edit</a></td>
        <td><a href={DeleteClientAction (get #id client)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
