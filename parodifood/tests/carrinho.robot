* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Take Screenshot

* Test Cases *
Deve adicionar um item ao carrinho

    &{restaurant}       Create Dictionary       name=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To Restaurants
    Choose Restaurant       ${restaurant}
    Add To Card             Starbugs 500 error
    Should Add To cart      Starbugs 500 error
    Total Cart Should Be    15,60

Deve adicionar três itens ao carrinho
    [tags]      temp
    
    &{restaurant}       Create Dictionary       name=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.
    
    Go To Restaurants
    Choose Restaurant       ${restaurant}
    
    Add To Card             Starbugs 500 error
    Should Add To cart      Starbugs 500 error

    Add To Card             Cappuccino com Chantilly
    Should Add To cart      Cappuccino com Chantilly

    Add To Card             Super Espreso
    Should Add To cart      Super Espreso
    
    Total Cart Should Be    38,00

* Keywords *
Choose Restaurant
    [Arguments]     ${restaurant}

    Click           text=${restaurant["name"]}

    Wait For Elements State     css=#detail     visible     10
    Get Text                    css=#detail     contains        ${restaurant["desc"]}

Add To Card
    [Arguments]     ${name}

    Click   xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To cart
    [Arguments]     ${name}
    Wait For Elements State     css=#cart tr >> text=${name}        visible     5

Total Cart Should Be
    [Arguments]     ${total}
    Get Text    xpath=//th[contains(text(), "Total")]/..//td        contains    ${total}