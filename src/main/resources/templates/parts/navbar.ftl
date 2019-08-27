
<#--<div class="container">-->
<#--    <div class="row">-->
<!-- MAIN -->
<main class="col-md-8 col-lg-9" xmlns="http://www.w3.org/1999/html"/>

<div class="header">
    <div class="navbar-fixed-top">
        <div class="container">
            <div class="navbar navbar-default">
                <a class="navbar-brand" href="/">MySite</a>
                <ul class="nav navbar-nav">

                    <#if isAdmin>
                        <li><a href="/user"> <@spring.message "all.users"/></a></li>
                    </#if>
                    <#--                                TODO FIX apearing profile while not valid form-->
                    <#if user??>
                        <li><a href="/profile"><@spring.message "profile"/></a></li>
                        <li><a href="/train-tickets"> <@spring.message "all.tickets"/></a></li>
                    </#if>
                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <a href="?lang=en"><span> EN </span></a>
                        <a href="?lang=uk"><span> UA </span></a>

                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <#--                                TODO rewrite user-->
                    <#if name=="">
                        <li><a href="/reg"><span
                                        class="glyphicon glyphicon-user"></span> <@spring.message "sign.up"/>
                            </a>
                        </li>
                        <li><a href="/login"><span
                                        class="glyphicon glyphicon-log-in"></span> <@spring.message "log.in"/>
                            </a>
                        </li>
                    <#else>
                        <li><a><span class="glyphicon glyphicon-user"></span> <@spring.message "hello"/>, ${name}
                            </a></li>
                    <#--                            <li><a href="/cart"><span class="glyphicon glyphicon-shopping-cart">Cart</span></a>-->
                        </li>
                        <li><a href="/logout"><span
                                        class="glyphicon glyphicon-log-out"></span> <@spring.message "log.out"/> </a>
                        </li>
                    </#if>
                </ul>

            </div>
        </div>
    </div>
</div>
</main>
<#--    </div>-->
<#--</div>-->
