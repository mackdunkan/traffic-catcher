module Web.View.Bonuses.Edit where
import Web.View.Prelude

data EditView = EditView { bonuse :: Bonuse }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={BonusesAction}>Bonuses</a></li>
                <li class="breadcrumb-item active">Edit Bonuse</li>
            </ol>
        </nav>
        <h1>Edit Bonuse</h1>
        {renderForm bonuse}
    |]

renderForm :: Bonuse -> Html
renderForm bonuse = formFor bonuse [hsx|
    {(textField #siteId)}
    {(textField #title)}
    {submitButton}
|]
