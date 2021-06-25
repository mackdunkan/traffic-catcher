module Web.View.Sites.Show where
import Web.View.Prelude

data ShowView = ShowView { site :: Include "bonuses" Site 
                        , clients :: [Client]}

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={SitesAction}>Ваши сайты</a></li>
                <li class="breadcrumb-item active">Показан сайт</li>
            </ol>
        </nav>
        <h1>{get #domain site}</h1>
        <em>id: {get #id site}</em>
        <br>
        <br>
        <a href={NewBonuseAction (get #id site)}>Добавить Бонус</a>
        <div>{forEach (get #bonuses site) renderBonuse}</div>
        <div>{forEach clients (renderClient (get #bonuses site))}</div>
    |]

renderBonuse bonuse = [hsx|
        <div class="mt-4">
            <h5>{get #title bonuse}</h5>
        </div>
    |]

renderClient bonuses client = [hsx|
        <div class="mt-4">
            <h6>Имя: {get #name client}</h6>
            <h6>Телефон: {get #phone client}</h6>
            <em>Бонус: {renderNameBonus (get #bonuseId client) bonuses}</em>
        </div>
    |]

renderNameBonus id bonuses = 
    let (Just bonuse) = find (\x -> id == (get #id x)) bonuses
    in
    [hsx| { get #title bonuse } |]