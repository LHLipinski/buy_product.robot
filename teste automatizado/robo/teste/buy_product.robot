*** Settings ***

Resource        ressources.robot

Test Teardown   encerrar seção


*** Test Cases ***
open ecomerce
    Open Browser                        ${url}      ${Browser}
choice product
    click element                       xpath=//*[@id="homefeatured"]/li[2]/div/div[2]/div[2]/a[1]
    Page Should Contain                 ${msgtxt}
send to cart
    click element                   css:[rel=nofollow]
register e-mail
    Wait Until Element Is Visible   id=email_create
    input text                      id=email_create         ${email}
    click element                   xpath=//*[@id="SubmitCreate"]
create account
    Wait Until Element Is Visible   xpath=//*[@id="account-creation_form"]
    Click Element                   id=id_gender1
    input text                      id=customer_firstname    ${name}
    input text                      id=customer_lastname     ${lname}
    input text                      id=passwd                ${pass}
    Select From List By Value       id=days                   1
    Select From List By Value       id=months                 1
    Select From List By Value       id=years                  1992
    input text                      id=address1              ${street}
    input text                      id=address2              ${street2}
    input text                      id=city                  ${city}
    Select From List By Value       id=id_state              ${state}
    input text                      id=postcode              ${cep}
    input text                      id=phone_mobile          ${phone}
    input text                      id=alias                 ${street}
    click element                   id=submitAccount
checkout shopping cart
    Element Should Be Visible       xpath=//*[@id="cart_summary"]/tbody
    click element                   xpath=//*[@id="center_column"]/p[2]/a[1]
confirm address
    page Should Contain             ${name}
    page Should Contain             ${lname}
    page Should Contain             ${city}
    page Should Contain             ${phone}
    click element                   xpath=//*[@id="center_column"]/form/p/button
agree terms of service
    click element                   id=cgv
    click element                   name=processCarrier
payment method
    ${paiment_v}    get text        class=page-heading
    Should be equal                 ${paiment_v}        ${paiment}
    click element                   xpath=//*[@id="HOOK_PAYMENT"]/div[1]/div/p/a
confirm bank wire
    ${v_value}  get text            xpath=//*[@id="amount"]
    Should be equal                 ${v_value}          ${Value}
    click element                   xpath=//*[@id="cart_navigation"]/button
end process
    page Should Contain             ${confirm}

