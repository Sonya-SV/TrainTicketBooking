<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="col-md-10 col-md-offset-1" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block"><@spring.message "order.tickets"/></h3>
            </div>
            <div class="panel-body">
                <#if ticket.train??>
                    <form action="/cart/pay" method="post" name="formTicket" style="margin: auto">
                        <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">

                            <tr>
                                <th><@spring.message "passenger"/></th>
                                <th><@spring.message "number"/></th>
                                <th><@spring.message "from"/>/<@spring.message "to"/></th>
                                <th><@spring.message "departure.date"/>/<@spring.message "arrival.date"/>
                                </th>
                                <th><@spring.message "time"/>
                                </th>
                                <th><@spring.message "price"/></th>
                            </tr>
                            <tr>
                                <td>
                                    ${ticket.firstName!} ${ticket.lastName!}
                                </td>
                                <td>${ticket.train.number!}</td>
                                <td>${ticket.train.route.departure!}
                                    <br>${ticket.train.route.arrival!}</td>
                                <td>${ticket.train.departureDate!}
                                    <br>${ticket.train.arrivalDate!}</td>
                                <td> ${ticket.train.departureTime!}
                                    <br>${ticket.train.arrivalTime!}</td>
                                <td> ${ticket.train.price!} UAH</td>


                            </tr>
                        </table>

                        <input type="hidden" name="passengerFirstName" value=" ${ticket.firstName!}">
                        <input type="hidden" name="passengerLastName" value=" ${ticket.lastName!}">
                        <input type="hidden" value="${ticket.train.id}" name="ticketId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <#if errorPay??>
                            <div class="text-danger">
                                ${errorPay!}
                            </div>
                            <a href="/profile/account">   <@spring.message "replenish"/> </a>
                        </#if>
                        <p> <@spring.message "your.current.balance"/> <#if user??>${user.balance}</#if></p>
                        <button type="submit">Pay</button>
                    </form>
                </#if>
            </div>
        </div>
    </div>

</@c.page>