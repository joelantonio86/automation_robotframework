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
     Conferir título da página com os produtos da categoria 

Caso de Teste 04: Adicionar Produtos no Carrinho
     Acessar a página home do site
     Digitar o nome do produto "t-shirt" no campo de pesquisa
     Clicar no botão Pesquisar
     Conferir se o produto "t-shirt" foi listado no site através da imagem
     Clicar no botão "Add to cart" do produto.
     Conferir mensagem de produto adcionado ao carrinho "Product successfully added to your shopping cart"
     Clicar no botão "Proceed to checkout"
     Conferir mensagem de valor total do produto "Total"
# *** Keywords ***
