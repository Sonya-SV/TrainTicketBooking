<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="col-md-6 col-md-offset-3" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block"> <@spring.message "edit"/></h3>
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
                    <button type="submit"><@spring.message "save"/></button>
                </form>
                <a href="/user/history/${user.id}"><@spring.message "history"/></a>

            </div>
        </div>
    </div>
    <div class="col-md-6 col-md-offset-3">
        <#if tickets??>

            <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
                <tr>
                    <th><@spring.message "passenger"/></th>
                    <th><@spring.message "number"/></th>
                    <th><@spring.message "from"/>/<@spring.message "to"/></th>
                    <th><@spring.message "departure.date"/>/<@spring.message "arrival.date"/>
                    </th>
                    <th><@spring.message "time"/>
                    </th>
                </tr>
                <#list tickets as ticket>
                    <tr>
                        <td>${ticket.firstname!}
                            <br>${ticket.lastName!}
                        </td>
                        <td>${ticket.train.number!}</td>
                        <td>${ticket.train.route.departure!}
                            <br>${ticket.train.route.arrival!}
                        </td>
                        <td>${ticket.train.departureDate!}
                            <br>${ticket.train.arrivalDate!}</td>
                        <td> ${ticket.train.departureTime!}
                            <br>${ticket.train.arrivalTime!}</td>
                    </tr>
                </#list>

            </table>

        </#if>
    </div>
</@c.page>