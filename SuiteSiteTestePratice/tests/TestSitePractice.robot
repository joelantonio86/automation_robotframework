*** Settings ***

Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

### SETUP ele roda keywords antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste


*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
     Acessar a página home do site
     Digitar o nome do produto "Blouse" no campo de pesquisa
     Clicar no botão Pesquisar
     Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
     Acessar a página home do site
     Digitar o nome do produto "ItemNãoExistente" no campo de Pesquisa
     Clicar no botão Pesquisar
     Conferir mensagem de erro "No results were found for your search "ItemNãoExistente""

Caso de Teste 03: Listar Produtos
     Acessar a página home do site
     Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
     Clicar na sub categoria "Summer Dresses" 

superior de categorias.
# *** Keywords ***
