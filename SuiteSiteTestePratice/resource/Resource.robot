*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary 


*** Variables ***
${BROwSER}      chrome
${URL}          http://automationpractice.com


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

Clicar no ícone carrinho de compras no menu superior direito.
    Click Element                       xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

Conferir se a tela de carrinho de compras foi exibida "${MENSAGEM_TELA_CARRINHO}"
    Wait Until Element Is Visible       xpath=//*[@id="columns"]/div[1]/span[2]
    Element Text Should Be              xpath=//*[@id="columns"]/div[1]/span[2]     ${MENSAGEM_TELA_CARRINHO}

Clicar no botão de remoção de produtos (delete) no produto do carrinho.
    Wait Until Element Is Visible       xpath=//*[@id="columns"]/div[1]/span[2]
    Click Element                       xpath=//*[@id="1_1_0_0"]/i

Conferir mensagem de produto excluído do carrinho "${MENSAGEM_EXCLUSAO}"
    Wait Until Element Is Visible       xpath=//*[@id="center_column"]/p
    Element Text Should Be              xpath=//*[@id="center_column"]/p     ${MENSAGEM_EXCLUSAO}

Clicar no botão superior direito “Sign in”.
    Click Element                       xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Conferir se a página para fazer login deve ser exibida. "${MENSAGEM_EMAIL}"
    Wait Until Element Is Visible       xpath=//*[@id="create-account_form"]/div/p      
    Element Text Should Be              xpath=//*[@id="create-account_form"]/div/p      ${MENSAGEM_EMAIL}

Inserir um e-mail válido.
    ${username}=                       FakerLibrary.User Name
    Input Text                         xpath=//*[@id="email_create"]          ${username}@mailinator.com

Clicar no botão "Create an account".
    Click Element                      xpath=//*[@id="SubmitCreate"]/span/i

Preencher os campos obrigatórios.
    Wait Until Element Is Visible 	  xpath=//*[@id="id_gender1"]
    Select Radio Button               id_gender      1
    ${first_name}                     FakerLibrary.First Name
    ${last_name}                      FakerLibrary.Last Name  
    ${password}                       FakerLibrary.Password
    ${company}                        FakerLibrary.Company
    ${address1}                       FakerLibrary.Address
    ${address2}                       FakerLibrary.Street Address
    ${city}                           FakerLibrary.City
    ${zip}                            FakerLibrary.Zipcode 
    ${other}                          FakerLibrary.Text
    ${Phone}                          FakerLibrary.Phone Number
    ${Phone_two}                      FakerLibrary.Phone Number
    Input Text                        id=customer_firstname       ${first_name}                             
    Input Text                        id=customer_lastname        ${last_name}      
    Input Text                        id=passwd                   123456
    Select From List By Value         id=days               22
    Select From List By Value         id=months             4
    Select From List By Value         id=years              1986
    Click Element                     id=newsletter
    Click Element                     id=uniform-optin
    Input Text                        id=company                    ${company}
    Input Text                        id=address1                   ${address1}
    Input Text                        id=city                       ${city}
    Select From List By Value         id=id_state           5
    Input Text                        id=postcode                   ${zip}
    Input Text                        id=other                      ${other}
    Input Text                        id=phone                      123212321321
    Input Text                        id=phone_mobile               456544898789
    Input Text                        id=alias                      ${address2}
    Input Text                        id=passwd                   123456                         

Clicar em "Register"para finalizar o cadastro.
    Click Button                      id=submitAccount

Conferir se a página de gerenciamento da conta deve ser exibida. "${MENSAGEM_CONFIRMACAO_CONTA}"
    Wait Until Element Is Visible    class=info-account
    Element Text Should Be           class=info-account          ${MENSAGEM_CONFIRMACAO_CONTA}





