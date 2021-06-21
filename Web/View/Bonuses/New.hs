module Web.View.Bonuses.New where
import Web.View.Prelude

data NewView = NewView { bonuse :: Bonuse
                        , site :: Site }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BonusesAction}>Bonuses</a></li>
                <li class="breadcrumb-item active">New Bonuse</li>
            </ol>
        </nav>
        <h1>New Bonuse for <q>{get #domain site}</q></h1>
        {renderForm bonuse}
    |]

renderForm :: Bonuse -> Html
renderForm bonuse = formFor bonuse [hsx|
    {(textField #siteId)}
    {(textField #title)}
    {submitButton}
|]
