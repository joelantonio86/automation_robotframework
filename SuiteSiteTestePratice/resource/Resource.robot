*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROwSER}   chrome
${URL}      http://automationpractice.com

*** Keywords ***
### Setup e Teardown
Abrir navegador
    Open Browser     about:blank  ${BROWSER}

Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site
    Go To                http://automationpractice.com
    Title Should Be 	 My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text      name=search_query     ${PRODUTO}

Clicar no botão pesquisar
    Click Element       name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   css=#center_column > h1

    Title Should Be                 Search - My Store
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir se o produto "${PRODUTO}" foi listado no site através da imagem
    Wait Until Element Is Visible   css=#center_column > h1
    Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/1/1-home_default.jpg']

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible   xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be          xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
    Mouse Over                       //*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria "Summer Dresses"
    Click Element 	                  //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Conferir título da página com os produtos da categoria
   Title Should Be                     Summer Dresses - My Store

Clicar no botão "${ADCIONAR}" do produto.
    Click Element                       xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span

Conferir mensagem de produto adcionado ao carrinho "${MENSAGEM_CONFIRMACAO}"
    Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
    Element Text Should Be              xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2     ${MENSAGEM_CONFIRMACAO}

Clicar no botão "${FAZER_CHECKOUT}"
    Click Element                       css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a > span
    
Conferir mensagem de valor total do produto "${MENSAGEM_VALOR_TOTAL}"
    Wait Until Element Is Visible       xpath=//*[@id="cart_summary"]/tfoot/tr[5]/td[1]
    Element Text Should Be              xpath=//*[@id="cart_summary"]/tfoot/tr[5]/td[1]     ${MENSAGEM_VALOR_TOTAL}
