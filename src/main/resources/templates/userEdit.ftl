<#import "parts/common.ftl" as c>
<@c.page>
    <div class="col-md-6 col-md-offset-3" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block">Edit</h3>
            </div>
            <div class="panel-body">
                <form action="/user" method="post" style="margin: auto">
                    <input type="text" name="username" value="${user.username}">
                    <#list roles as role>
                        <div>
                            <label><input type="checkbox"
                                          name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                            </label>
                        </div>
                    </#list>
                    <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit">Save</button>
                </form>
            </div>
        </div>
    </div>

</@c.page>