<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="padding-top: 10%">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
                    <tr>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Edit</th>
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
                                <td><a href="/user/${user.id}"> Edit</a></td>
                                <td><a href="/history/${user.id}"> Edit</a></td>
                            </tr>
                        </#list>
                    </#if>


                </table>
            </div>
        </div>
    </div>
</@c.page>