<div class="container">
    <div class="row">
        <!-- MAIN -->
        <main class="col-md-8 col-lg-9">
            <div class="header">
                <div class="navbar-fixed-top">
                    <div class="container">
                        <div class="navbar navbar-default">
                            <a class="navbar-brand" href="/">MySite</a>
                            <ul class="nav navbar-nav">
<#--                                <li><a href="/main">Main</a></li>-->
                                <#if isAdmin>
                                    <li><a href="/user">Users</a></li>
                                </#if>
<#--                                TODO FIX apearing profile while not valid form-->
                                <#if user??>
                                    <li><a href="/profile">Profile</a></li>
                                    <li><a href="/train-tickets">Tickets</a></li>
                                </#if>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
<#--                                TODO rewrite user-->
                                <#if name=="">
                                    <li><a href="/reg"><span class="glyphicon glyphicon-user"></span><@spring.message "sign.up"/></a>
                                    </li>
                                    <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span><@spring.message "log.in"/> </a>
                                    </li>
                                <#else>
                                    <li><a><span class="glyphicon glyphicon-user"></span> Hello, ${name}</a></li>
                                    <li><a href="/cart"><span class="glyphicon glyphicon-shopping-cart">Cart</span></a></li>
                                    <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Log out </a>
                                    </li>
                                </#if>
                            </ul>

                            <label for="locales">
                                <select id="locales">
                                    <option value=""></option>
                                    <option value="en" ><@spring.message "lang.eng"/></option>
                                    <option value="uk"><@spring.message "lang.uk"/></option>
                                </select>
                            </label>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
