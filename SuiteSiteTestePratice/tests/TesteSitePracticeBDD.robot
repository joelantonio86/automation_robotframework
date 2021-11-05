*** Settings ***

Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${BROwSER}   chrome
${URL}      http://automationpractice.com


*** Test Case ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site  
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site  
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""
Caso de Teste 03: Listar Produtos
    Dado que estou na página home do site
    Quando eu passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
    E Clicar na sub categoria "Summer Dresses"
    Então deve exibir a página com os produtos da categoria com o título Summer Dresses

*** Keywords ***
Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem de erro "${MENSAGEM_ALERTA}"

Quando eu passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.

E Clicar na sub categoria "Summer Dresses"
    Clicar na sub categoria "Summer Dresses"

Então deve exibir a página com os produtos da categoria com o título Summer Dresses
    Conferir título da página com os produtos da categoria

