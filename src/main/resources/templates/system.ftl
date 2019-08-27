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