*** Settings ***
Test Setup        Ava liisinguvorm
Test Teardown     Close Browser
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.lhv.ee/corp/leasing/index.cfm?l3=et&
${browser}        googlechrome
${soidukihind}    tere
${sissemakseprotsent}    20
${sissemaksesumma}    10000
${perioodaasta}    3
${perioodkuu}     6
${jaakprotsent}    25
${jaaksumma}      1000
${maksepaev}      25

*** Test Cases ***
Eraisik kasutusrent
    Vali liising eraisikuna
    Vali liisingu tüüp kasutusrent
    Sisesta sõiduki hind
    Hind sisaldab käibemaksu
    Sisesta sissemakse protsent
    Sisesta liisingu periood aasta
    Sisesta liisingu periood kuud
    Sisesta jääkväärtus summa
    Sisesta maksepäev
    Kinnita vorm

Eraisik kapitalirent
    Vali liising eraisikuna
    Vali liisingu tüüp kapitalirent
    Sisesta sõiduki hind
    Hind ei sisalda käibemaksu
    Sisesta sissemakse summa
    Sisesta liisingu periood aasta
    Sisesta liisingu periood kuud
    Sisesta jääkväärtus protsent
    Sisesta maksepäev
    Kinnita vorm

Juriidiline isik kasutusrent
    Vali liising juriidilise isikuna
    Vali liisingu tüüp kasutusrent
    Sisesta sõiduki hind
    Hind ei sisalda käibemaksu
    Sisesta sissemakse protsent
    Sisesta liisingu periood aasta
    Sisesta liisingu periood kuud
    Sisesta jääkväärtus protsent
    Sisesta maksepäev
    Kinnita vorm

Juriidiline isik kapitalirent
    Vali liising juriidilise isikuna
    Vali liisingu tüüp kapitalirent
    Sisesta sõiduki hind
    Hind sisaldab käibemaksu
    Sisesta sissemakse summa
    Sisesta liisingu periood aasta
    Sisesta liisingu periood kuud
    Sisesta jääkväärtus summa
    Sisesta maksepäev
    Kinnita vorm

*** Keywords ***
Ava liisinguvorm
    Open browser    ${url}    ${browser}
    Element Should Be Visible    account_type
    Element Should Be Visible    lease_type
    Element Should Be Visible    origin-price
    Element Should Be Visible    vat_included
    Element Should Be Visible    initial_percentage
    Element Should Be Visible    initial
    Page should Contain element    duration_years
    Page should Contain element    duration_months
    Element Should Be Visible    reminder_percentage
    Element Should Be Visible    reminder
    Page should Contain element    payment_day

Vali liising juriidilise isikuna
    Select Radio Button    account_type    account_type-C
    Radio Button Should Be Set To    account_type    C

Vali liising eraisikuna
    Select Radio Button    account_type    account_type-P
    Radio Button Should Be Set To    account_type    P

Vali liisingu tüüp kapitalirent
    Select Radio Button    lease_type    lease_type-HP
    Radio Button Should Be Set To    lease_type    HP

Vali liisingu tüüp kasutusrent
    Select Radio Button    lease_type    lease_type-FL
    Radio Button Should Be Set To    lease_type    FL

Sisesta sõiduki hind
    Input Text    origin-price    ${soidukihind}

Hind sisaldab käibemaksu
    Select Checkbox    vat_included
    Checkbox Should Be Selected    vat_included

Hind ei sisalda käibemaksu
    Unselect Checkbox    vat_included
    Checkbox Should Not Be Selected    vat_included

Sisesta sissemakse protsent
    Input Text    initial_percentage    ${sissemakseprotsent}
    Element Text Should Be    initial_percentage    ${sissemakseprotsent}

Sisesta sissemakse summa
    Input Text    initial    ${sissemaksesumma}
    Element Text Should Be    initial    ${sissemaksesumma}

Sisesta liisingu periood aasta
    Select From List By Value    duration_years    {perioodaasta}
    Element Text Should Be    duration_years    {perioodaasta}

Sisesta liisingu periood kuud
    Select From List By Value    duration_months    {perioodkuu}
    Element Text Should Be    duration_months    {perioodkuu}

Sisesta jääkväärtus protsent
    Input Text    reminder_percentage    ${jaakprotsent}
    Element Text Should Be    reminder_percentage    ${jaakprotsent}

Sisesta jääkväärtus summa
    Input Text    reminder    ${jaaksumma}
    Element Text Should Be    reminder    ${jaaksumma}

Sisesta maksepäev
    Select From List By Value    payment_day    {maksepaev}
    Element Text Should Be    payment_day    {maksepaev}

Kinnita vorm
    Click Button    Edasi
