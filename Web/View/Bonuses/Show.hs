module Web.View.Bonuses.Show where
import Web.View.Prelude

data ShowView = ShowView { bonuse :: Bonuse }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BonusesAction}>Bonuses</a></li>
                <li class="breadcrumb-item active">Show Bonuse</li>
            </ol>
        </nav>
        <h1>Show Bonuse</h1>
        <p>{bonuse}</p>
    |]
