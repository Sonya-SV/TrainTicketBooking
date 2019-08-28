<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block"><@spring.message "log.in"/></h3>
                    </div>
                    <div class="panel-body">
                        <form name="form" action="/login" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">
                            <#if error??>
                                <h3 style="color: red"> <@spring.message "invalid.user"/></h3>
                            </#if>
                            <#if logout??>
                                <h3 style="color: green"> <@spring.message "user.log.out"/></h3>
                            </#if>

                            <div class="form-group">
                                <label id="username" for="username"><@spring.message "username.label"/></label>
                                <input type="username"
                                       class="form-control"
                                       name="username"
                                       id="username"
                                       placeholder="<@spring.message "username.label"/>"
                                       required>

                            </div>
                            <div class="form-group">
                                <label id="passwordLabel" for="password"><@spring.message "password.label"/></label>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="<@spring.message "password.label"/>"
                                       required>

                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                <@spring.message "log.in"/>
                            </button></form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>