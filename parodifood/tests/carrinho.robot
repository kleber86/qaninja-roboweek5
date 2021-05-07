* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup          Start Session
Test Teardown       Take Screenshot

* Test Cases *
Deve adicionar um item ao carrinho

    &{restaurant}       Create Dictionary       restaurant=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To Restaurants
    Choose Restaurant       ${restaurant}
    Add To Card             Starbugs 500 error
    Should Add To cart      Starbugs 500 error
    Total Cart Should Be    15,60

Deve adicionar três itens ao carrinho
    [tags]      temp

    ${cart_json}        Get JSON        cart.json
    
    Go To Restaurants
    Choose Restaurant       ${cart_json}
    
    FOR     ${product}  IN  @{cart_json["products"]}
        Add To Card             ${product["name"]}
        Should Add To cart      ${product["name"]}
    END
    
    Total Cart Should Be    ${cart_json["total"]}