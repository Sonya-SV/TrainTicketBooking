<#macro page>
    <#import "/spring.ftl" as spring/>
    <!DOCTYPE HTML>
    <html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta charset="UTF-8">
        <title>Registration form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<#--                <script type="text/javascript">-->
<#--                    $(document).ready(function () {-->
<#--                        $("#locales").change(function () {-->
<#--                            var selectedOption = $('#locales').val();-->
<#--                            if (selectedOption !== '') {-->
<#--                                window.location.replace('locale?lang=' + selectedOption);-->
<#--                            }-->
<#--                        });-->
<#--                    });-->
<#--                </script>-->
        <link rel="icon" href="/locales/polylang/flags/en_US.png" type="image/x-icon">
        <link rel="icon" href="/locales/polylang/flags/uk.png" type="image/x-icon">
    </head>
    <body data-spy="scroll">
    <#include "sec.ftl">
    <#include "navbar.ftl">

    <div class="container theme-showcase" role="main">
        <#nested >
    </div>
    <div>
        <#include "footer.ftl">
    </body>
    </html>

</#macro>