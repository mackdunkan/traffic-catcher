module Web.View.Sites.Show where
import Web.View.Prelude

data ShowView = ShowView { site :: Include "bonuses" Site }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SitesAction}>Sites</a></li>
                <li class="breadcrumb-item active">Show Site</li>
            </ol>
        </nav>
        <h1>{get #domain site}</h1>
        <a href={NewBonuseAction (get #id site)}>Add Bonuse</a>
        <div>{forEach (get #bonuses site) renderBonuse}</div>
    |]

renderBonuse bonuse = [hsx|
        <div class="mt-4">
            <h5>{get #title bonuse}</h5>
        </div>
    |]