<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <div class="col-md-10 col-md-offset-1" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block"><@spring.message "order.tickets"/></h3>
            </div>
            <div class="panel-body">
                <form action="/cart" method="post" style="margin: auto">

                    <div class="form-group">
                        <label id="exampleInputFirstNameLabel" for="firstName"><@spring.message "first.name"/></label>
                        <input type="text" value="<#if user??>${user.firstName}</#if>"
                               class="form-control"
                               name="firstName"
                               id="firstName"
                               placeholder="<@spring.message "first.name"/>"
                               required>
                        <div class="text-danger">
                            ${firstNameError!}
                        </div>
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
                    </div>
                    <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
                        <tr>
                            <th><@spring.message "number"/></th>
                            <th><@spring.message "from"/>/<@spring.message "to"/></th>
                            <th><@spring.message "departure.date"/>/<@spring.message "arrival.date"/>
                            </th>
                            <th><@spring.message "time"/>
                            </th>
                            <th><@spring.message "price"/></th>
                        </tr>
                        <tr>
                            <td>${train.number!}</td>
                            <td>${train.route.departure!}
                                <br>${train.route.arrival!}</td>
                            <td>${train.departureDate!}
                                <br>${train.arrivalDate!}</td>
                            <td> ${train.departureTime!}
                                <br>${train.arrivalTime!}</td>
                            <td> ${train.price}</td>
                        </tr>
                    </table>

                    <input type="hidden" value="${train.id}" name="trainId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit"><@spring.message "add.to.cart"/></button>
                </form>
            </div>
        </div>
    </div>

</@c.page>