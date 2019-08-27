<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class=" panel-heading">
                        <h3 class="panel-title" style="display: inline-block"><@spring.message "register.button"/></h3>
                    </div>
                    <div class="panel-body">
<#--                        <h3 style="color: red">${message!}</h3>-->
                        <form action="/reg" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <div class="form-group">
                                <label id="usernameLabel" for="username"> <@spring.message "username.label"/></label>
                                <input type="text" value="<#if user??>${user.username}</#if>"
                                       class="form-control"
                                       name="username"
                                       id="username"
                                       placeholder="<@spring.message "username.label"/>"
                                       required>
<#--                                <#if usernameError??>-->
                                    <div class="text-danger">
                                        ${usernameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="exampleInputFirstNameLabel" for="firstName"><@spring.message "first.name"/></label>
                                <input type="text" value="<#if user??>${user.firstName}</#if>"
                                       class="form-control"
                                       name="firstName"
                                       id="firstName"
                                       placeholder="<@spring.message "first.name"/>"
                                       required>
<#--                           /     <#if firstNameError??>-->
                                    <div class="text-danger">
                                        ${firstNameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="exampleInputLastNameLabel" for="lastName"><@spring.message "last.name"/></label>
                                <input type="text" value="<#if user??>${user.lastName}</#if>"
                                       class="form-control"
                                       id="lastName"
                                       name="lastName"
                                       placeholder="<@spring.message "last.name"/>"
                                       required>
<#--                                <#if lastNameError??>-->
                                    <div class="text-danger">
                                        ${lastNameError!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="passwordLabel" for="password"><@spring.message "password.label"/></label>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="<@spring.message "password.label"/>"
                                       required>
<#--                                <#if passwordError??>-->
                                    <div class="text-danger">
                                        ${passwordError!}
                                         ${passwordErrorDiffer!}
                                    </div>
<#--                                </#if>-->
                            </div>
                            <div class="form-group">
                                <label id="password2Label" for="password2"><@spring.message "password.label"/></label>
                                <input type="password"
                                       class="form-control"
                                       id="password2"
                                       name="password2"
                                       placeholder="<@spring.message "password.label"/>"
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
<#--                                    ng-submit="form.$valid"-->>
                                <@spring.message "register.button"/>
                            </button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</@c.page>