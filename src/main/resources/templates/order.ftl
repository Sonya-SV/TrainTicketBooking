<#import "parts/common.ftl" as c>
<@c.page>
    <div class="col-md-10 col-md-offset-1" style="padding-top: 10%">
        <div class="panel panel-default">
            <div class=" panel-heading">
                <h3 class="panel-title" style="display: inline-block">Order tickets</h3>
            </div>
            <div class="panel-body">
                <form action="/cart" method="post" style="margin: auto">

                    <div class="form-group">
                        <label id="exampleInputFirstNameLabel" for="firstName">First name</label>
                        <input type="text" value="<#if user??>${user.firstName}</#if>"
                               class="form-control"
                               name="firstName"
                               id="firstName"
                               placeholder="First Name"
                               required>
                        <div class="text-danger">
                            ${firstNameError!}
                        </div>
                    </div>

                    <div class="form-group">
                        <l`abel id="exampleInputLastNameLabel" for="lastName">Last name</label>
                        <input type="text" value="<#if user??>${user.lastName}</#if>"
                               class="form-control"
                               id="lastName"
                               name="lastName"
                               placeholder="Last Name"
                               required>
                        <#--                                <#if lastNameError??>-->
                        <div class="text-danger">
                            ${lastNameError!}
                        </div>
                    </div>
                    <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
                        <tr>
                            <th>Number</th>
                            <th>From/To</th>
                            <th>Date</th>
                            <th>Departure
                                <br> Arrival
                            </th>
                            <th>Price</th>
                        </tr>
                        <tr>
                            <td>${train.number!}</td>
                            <td>${departure!}
                                <br>${arrival!}</td>
                            <td>${train.departureDate!}
                                <br>${train.arrivalDate!}</td>
                            <td> ${train.departureTime!}
                                <br>${train.arrivalTime!}</td>
                            <td> ${train.price}</td>
                        </tr>
                    </table>

                    <input type="hidden" value="${train.id}" name="trainId">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
        </div>
    </div>

</@c.page>