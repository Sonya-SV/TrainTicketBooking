<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="padding-top: 50px">
                <#include "common_profile.ftl">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block">${username!}</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <#--                            TODO add check password in profile-->
                            <div class="form-group">
                                <label id="exampleInputFirstNameLabel"
                                       for="firstName"><@spring.message "first.name"/></label>
                                <input type="text"
                                       class="form-control"
                                       name="firstName"
                                       id="firstName"
                                       placeholder="<@spring.message "first.name"/>"
                                       value="${firstName!}"
                                       required>
                            </div>
                            <div class="form-group">
                                <label id="exampleInputLastNameLabel"
                                       for="lastName"><@spring.message "last.name"/></label>
                                <input type="text"
                                       class="form-control"
                                       id="lastName"
                                       name="lastName"
                                       placeholder="<@spring.message "last.name"/>"
                                       value="${lastName!}"
                                       required>
                            </div>
                            <div class="form-group">
                                <label id="passwordLabel" for="password"><@spring.message "password.label"/></label>
                                <input type="password"
                                       class="form-control"
                                       id="password"
                                       name="password"
                                       placeholder="<@spring.message "password.label"/>"
                                       value="${password!}"
                                       required>
                                <div class="text-danger">
                                    ${password2Error!}
                                    ${passwordErrorDiffer!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label id="password2Label" for="password2">Password</label>
                                <input type="password"
                                       class="form-control"
                                       id="password2"
                                       name="password2"
                                       placeholder="<@spring.message "password.label"/>"
                                       value="${password!}"
                                       required>
                                <#--                                <#if passwordErrorDiffer??>-->
                                <div class="text-danger">
                                    ${password2Error!}
                                    ${passwordErrorDiffer!}
                                </div>
                            </div>
                            <div class="text-success">
                                ${successSave!}
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                <@spring.message "save"/>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>