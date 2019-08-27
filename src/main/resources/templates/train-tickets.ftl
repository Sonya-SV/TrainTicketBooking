<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-8 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block">Login</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form-inline" action="/train-tickets" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <div class="form-group">
                                <label id="departureLabel" for="departure">From</label>
                                <input type="text"
                                       class="form-control"
                                       name="departure"
                                       id="departure"
                                       placeholder="Departure"
                                       value="Kyiv"
                                       required>

                            </div>
                            <div class="form-group">
                                <label id="arrivalLabel" for="arrival">To</label>
                                <input type="text"
                                       class="form-control"
                                       id="arrival"
                                       name="arrival"
                                       placeholder="Arrival"
                                       value="Cherkasy"
                                       required>

                            </div>
                            <#--                            TODO refill on another date-->
                            <div class="form-group">
                                <label id="dateLabel" for="date">Departure date</label>
<#--                                <div class="col-xs-2">-->
                            <input type="date" name="date" value="2019-08-28" max="2019-09-28" min="2019-08-28">
<#--                                </div>-->
                            </div>
                            <div class="form-group">
                                <label id="timeLabel" for="time">Departure time from</label>
<#--                                <div class="col-xs-2">-->
                                    <input class="form-control" type="time" name="time" value="00:00" id="example-time-input">
<#--                                </div>-->
                            </div>

                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                Find
                            </button>



                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="container" style="padding-top: 10%">
        <div class="row">
            <div class="col-md-4 col-md-offset-3" style="padding-top: 50px">
                <#include "trainList.ftl"/>
            </div>
        </div>
    </div>
</@c.page>


