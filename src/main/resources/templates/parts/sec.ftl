<#assign known = Session.SPRING_SECURITY_CONTEXT?? >

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    authorities = Session.SPRING_SECURITY_CONTEXT.authentication.authorities
    isAdmin = false>
    <#list authorities as authority>
        <#if authority = 'ADMIN'>
            <#assign isAdmin = true >
        </#if>
    </#list>
<#else>
    <#assign
    name = ""
    isAdmin = false
    >
</#if>