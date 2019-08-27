<#import "parts/common.ftl" as c>
<@c.page>
    <div class="col-md-10 col-md-offset-1" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block">Order tickets</h3>
            </div>
            <div class="panel-body">
                <#if ticket.train??>
                    <form action="/cart/pay" method="post" name="formTicket" style="margin: auto">

                        <#--                    <input name="firstName" type="hidden" value="${ticket.firstName!}">-->
                        <#--                    <input name="lastName" type="hidden" value="${ticket.lastName!}">-->
                        <#--                    <input name="train.number" type="hidden" value="${ticket.train.number!}">-->
                        <#--                    <input name="train.route.departure" type="hidden" value="${ticket.train.route.departure!}">-->
                        <#--                    <input name="train.route.arrival" type="hidden" value="${ticket.train.route.arrival!}">-->
                        <#--                    <input name="train.departureDate" type="hidden" value="${ticket.train.departureDate!}">-->
                        <#--                    <input name="train.arrivalDate" type="hidden" value="${ticket.train.arrivalDate!}">-->
                        <#--                    <input name="train.departureTime" type="hidden" value="${ticket.train.departureTime!}">-->
                        <#--                    <input name="train.arrivalTime" type="hidden" value="${ticket.train.arrivalTime!}">-->
                        <#--                    <input name="train.price" type="hidden" value="${ticket.train.price!}">-->

                        <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">

                            <tr>
                                <td>Passenger</td>
                                <th>Number</th>
                                <th>From/To</th>
                                <th>Date</th>
                                <th>Departure
                                    <br> Arrival
                                </th>
                                <th>Price</th>
                            </tr>
                            <tr>

                                <#--                            <td name ="firstName">-->
                                <#--                                ${ticket.firstName!} ${ticket.lastName!}</td>-->

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
                            <h3 style="text-decoration-color: red"> ${errorPay!}</h3>
                        </div>
                        <a href="/profile/account"> Replenish the balance </a>
                        </#if>
                        <p> Your balance: <#if user??>${user.balance}</#if></p>
                        <button type="submit">Pay</button>
                    </form>
                <#else >
                    Cart is empty
                </#if>
            </div>
        </div>
    </div>

</@c.page>