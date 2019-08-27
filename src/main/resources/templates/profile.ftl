<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="/profile">Personal settings </a></li>
                    <li><a href="/profile/account">Account</a></li>
                    <li><a href="/history">History</a></li>
                </ul>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block">${username!}</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <#--                            TODO add check password in profile-->
                            <div class="form-group">
                                <label id="exampleInputFirstNameLabel" for="firstName">First name</label>
                                <input type="text"
                                       class="form-control"
                                       name="firstName"
                                       id="firstName"
                                       placeholder="First Name"
                                       value="${firstName!}"
                                       required>
                            </div>
                            <div class="form-group">
                                <label id="exampleInputLastNameLabel" for="lastName">Last name</label>
                                <input type="text"
                                       class="form-control"
                                       id="lastName"
                                       name="lastName"
                                       placeholder="Last Name"
                                       value="${lastName!}"
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
                                       placeholder="Password"
                                       required>
                                <#--                                <#if passwordErrorDiffer??>-->
                                <div class="text-danger">
                                    ${password2Error!}
                                    ${passwordErrorDiffer!}
                                </div>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                Save
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>