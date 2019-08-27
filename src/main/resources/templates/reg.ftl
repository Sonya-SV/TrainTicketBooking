<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        <h3 class="panel-title" style="display: inline-block">Registration</h3>
                    </div>
                    <div class="panel-body">
<#--                        <h3 style="color: red">${message!}</h3>-->
                        <form action="/reg" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <div class="form-group">
                                <label id="usernameLabel" for="username"> Username</label>
                                <input type="text" value="<#if user??>${user.username}</#if>"
                                       class="form-control"
                                       name="username"
                                       id="username"
                                       placeholder="username"
                                       required>
<#--                                <#if usernameError??>-->
                                    <div class="text-danger">
                                        ${usernameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="exampleInputFirstNameLabel" for="firstName">First name</label>
                                <input type="text" value="<#if user??>${user.firstName}</#if>"
                                       class="form-control"
                                       name="firstName"
                                       id="firstName"
                                       placeholder="First Name"
                                       required>
<#--                           /     <#if firstNameError??>-->
                                    <div class="text-danger">
                                        ${firstNameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="exampleInputLastNameLabel" for="lastName">Last name</label>
                                <input type="text" value="<#if user??>${user.lastName}</#if>"
                                       class="form-control"
                                       id="lastName"
                                       name="lastName"
                                       placeholder="Last Name"
                                       required>
<#--                                <#if lastNameError??>-->
                                    <div class="text-danger">
                                        ${lastNameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="passwordLabel" for="password">Password</label>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="Password"
                                       required>
<#--                                <#if passwordError??>-->
                                    <div class="text-danger">
                                        ${passwordError!}
                                         ${passwordErrorDiffer!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="password2Label" for="password2">Password</label>
                                <input type="password"
                                       class="form-control"
                                       id="password2"
                                       name="password2"
                                       placeholder="Password"
                                       required>
<#--                                <#if passwordErrorDiffer??>-->
                                    <div class="text-danger">
                                    ${password2Error!}
                                        ${passwordErrorDiffer!}
                                    </div>
<#--                                </#if>-->
                            </div>

                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
<#--                                    ng-submit="form.$valid"-->
                            >
                                Registration
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</@c.page>