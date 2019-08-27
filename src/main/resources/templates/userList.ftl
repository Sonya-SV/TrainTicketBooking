<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="container" style="padding-top: 10%">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
                    <tr>
                        <th><@spring.message "username.label"/></th>
                        <th><@spring.message "first.name"/></th>
                        <th><@spring.message "last.name"/></th>
                        <th><@spring.message "role"/></th>
                        <th><@spring.message "edit"/></th>
                    </tr>

                    <#if users??>
                        <#list users as user>
                            <tr>
                                <td>${user.username}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>
                                    <#list user.roles as role>
                                        ${role}<#sep>, </#list>
                                </td>
                                <td><a href="/user/${user.id}"> <@spring.message "edit"/></a></td>
<#--                                <td><a href="/history/${user.train.id}"> Edit</a></td>-->
                            </tr>
                        </#list>
                    </#if>


                </table>
            </div>
        </div>
    </div>
</@c.page>