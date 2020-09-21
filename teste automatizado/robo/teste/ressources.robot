*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${url}          http://automationpractice.com/index.php?
${Browser}      Chrome
${msgok}        xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2/text()
${msgtxt}       Product successfully added to your shopping cart
${email}        teste.robots@execution.com
${name}         teste
${lname}        teste
${pass}         123456pass
${street}       Street teste
${street2}      apart
${city}         cidade
${state}        3
${cep}          00000
${phone}        000000000
${value}        $29.00
${paiment}      PLEASE CHOOSE YOUR PAYMENT METHOD
${confirm}      Your order on My Store is complete.
*** Keywords ***
encerrar seção
    Capture Page Screenshot