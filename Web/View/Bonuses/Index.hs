module Web.View.Bonuses.Index where
import Web.View.Prelude

data IndexView = IndexView { bonuses :: [Bonuse] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <!-- <li class="breadcrumb-item active"><a href={BonusesAction}>Bonuses</a></li> -->
            </ol>
        </nav>
        <h1>Index</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Bonuse</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach bonuses renderBonuse}</tbody>
            </table>
        </div>
    |]


renderBonuse bonuse = [hsx|
    <tr>
        <td>{bonuse}</td>
        <td><a href={ShowBonuseAction (get #id bonuse)}>Show</a></td>
        <td><a href={EditBonuseAction (get #id bonuse)} class="text-muted">Edit</a></td>
        <td><a href={DeleteBonuseAction (get #id bonuse)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
