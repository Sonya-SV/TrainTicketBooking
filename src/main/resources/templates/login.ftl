<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block">Login</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form" action="/login" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">
                            <#if error??>
                                <h3 style="color: red"> Invalid username or password</h3>
                            </#if>
                            <#if logout??>
                                <h3 style="color: green"> You are successfully log out</h3>
                            </#if>

                            <div class="form-group">
                                <label id="username" for="username">Username</label>
                                <input type="username"
                                       class="form-control"
                                       name="username"
                                       id="username"
                                       placeholder="Username"
                                       required>

                            </div>
                            <div class="form-group">
                                <label id="passwordLabel" for="password">Password</label>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="Password"
                                       required>

                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                Log in
                            </button></form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>