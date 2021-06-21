module Web.View.Sites.Index where
import Web.View.Prelude

data IndexView = IndexView { sites :: [Site] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={SitesAction}>Sites</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewSiteAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Sites</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach sites renderSite}</tbody>
            </table>
        </div>
    |]


renderSite site = [hsx|
    <tr>
        <td>{get #domain site}</td>
        <td><a href={ShowSiteAction (get #id site)}>Show</a></td>
        <td><a href={EditSiteAction (get #id site)} class="text-muted">Edit</a></td>
        <td><a href={DeleteSiteAction (get #id site)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
