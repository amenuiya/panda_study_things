*** Settings ***
Library  SeleniumLibrary
Test Template  Pesquisar no google pelo texto


#Uma outra forma de deixar organizado é colocar o nome da variável na frente do test carses, ex:
#*** Test Cases ***  texto_buscar
*** Test Cases ***
Pesquisar pelo batman  Batman
Pesquisar por pandas  Panda
Pesquisar por elefantes  Elefante
 

*** Keywords ***
Pesquisar no google pelo texto
    [Arguments]  ${texto_buscar}
    Set Global Variable  ${texto_buscar}
    Entrar na página do google
    Pesquisar pelo texto
 
Entrar na página do google
    Open Browser  about:blank  headlesschrome
    Go To  https://google.com/

Pesquisar pelo texto
  Input text  name=q  ${texto_buscar}
  Wait Until Keyword Succeeds    2s    2s    Click Element    name=btnK
  Capture Page Screenshot
  
  