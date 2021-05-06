
* Settings *
Library     Browser

* Test Cases *
Deve buscar um único restaurante
    Start Session
    Go To Restaurants
    Search By                       Debuger
    Restaurant Should Be Visible    DEBUGER KING
    Restaurant Count Should Be      1
    
    Take Screenshot

Deve buscar por categoria
    Start Session
    Go To Restaurants
    Search By                     cafe
    Restaurant Should Be Visible  STARBUGS COFFEE
    
    Take Screenshot

Deve buscar todos os restaurantes
    Start Session
    Go To Restaurants
    Search By       a
    Restaurant Count Should Be  5
    
    Take Screenshot

* Keywords *
Start Session
    New Browser     chromium    false
    New Page        http://parodifood.qaninja.academy/
    #Checkpoint
    Get Text        css=span  contains       Nunca foi tão engraçado pedir comida

Go To Restaurants
    Click           text=Estou com fome!
    Get Text        css=h1 strong   contains    Ta na hora de matar a fome!

Search By
    [Arguments]     ${value}

    Click           css=.search-link
    Fill Text       css=input[formcontrolname=searchControl]    ${value}

Restaurant Should Be Visible
    [Arguments]     ${name}

    Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]    visible     10
    Get Text        css=.place-info-box     contains    ${name}

Restaurant Count Should Be
    [Arguments]     ${qtd}

    Wait For Elements State     css=.place-info-box     visible     10
    Get Element Count           css=.place-info-box     equal       ${qtd}