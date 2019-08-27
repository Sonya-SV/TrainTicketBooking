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
                        <form name="form" action="/profile/account" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <h4>Your current balance ${balance}</h4>
                            <div class="form-group">
                                <label id="replenishmentAmountLabel" for="replenishmentAmount">Enter the amount you want to replenish</label>
                                <input type="number"
                                       min="0.01"
                                       class="form-control"
                                       name="replenishmentAmount"
                                       id="replenishmentAmount"
                                       placeholder="100.00"
                                       required>

                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                Replenish the balance
                            </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@c.page>