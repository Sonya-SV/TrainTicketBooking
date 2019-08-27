<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="container" style="margin-top: 60px">
        <div class="row">
            <div class="col-md-8 col-md-offset-3" style="padding-top: 50px">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="display: inline-block"><@spring.message "tickets.label"/></h3>
                    </div>
                    <div class="panel-body">
                        <form name="form-inline" action="/train-tickets" method="post" autocomplete="off" novalidate
                              ng-submit="form.$valid ">

                            <div class="form-group">
                                <label id="departureLabel" for="departure"><@spring.message "from"/></label>
                                <input type="text"
                                       class="form-control"
                                       name="departure"
                                       id="departure"
                                       placeholder="<@spring.message "departure"/>"
                                       value="Kyiv"
                                       required>

                            </div>
                            <div class="form-group">
                                <label id="arrivalLabel" for="arrival"><@spring.message "to"/></label>
                                <input type="text"
                                       class="form-control"
                                       id="arrival"
                                       name="arrival"
                                       placeholder="<@spring.message "arrival"/>"
                                       value="Cherkasy"
                                       required>

                            </div>
                            <#--                            TODO refill on another date-->
                            <div class="form-group">
                                <label id="dateLabel" for="date"><@spring.message "departure.date"/></label>
<#--                                <div class="col-xs-2">-->
                            <input type="date" name="date" value="2019-08-28" max="2019-09-28" min="2019-08-28">
<#--                                </div>-->
                            </div>
                            <div class="form-group">
                                <label id="timeLabel" for="time"><@spring.message "departure.time.from"/></label>
<#--                                <div class="col-xs-2">-->
                                    <input class="form-control" type="time" name="time" value="00:00" id="example-time-input">
<#--                                </div>-->
                            </div>

                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-success" style="margin-top:30px"
                                    ng-disabled="form.$invalid">
                                <@spring.message "find"/>
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


