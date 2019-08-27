<#import "parts/common.ftl" as c>
<@c.page>
    <#if trains??>
    <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
    <tr>
        <th>Number</th>
        <th>From/To</th>
        <th>Date</th>
        <th>Departure
        <br> Arrival</th>
        <th>Seats available</th>
    </tr>
        <#list trains as train>
            <tr>
                <td>${train.number!}</td>
                <td>${departure!}
                    <br>${arrival!}</td>
                <td>${train.departureDate!}
                    <br>${train.arrivalDate!}</td>
                <td> ${train.departureTime!}
                <br>${train.arrivalTime!}</td>
                <td>${train.freePlaces!}/${train.totalPlaces} <a href="/tickets/${train.id}"> Choose</a></td>
            </tr>
        </#list>
    </table>
        <#else>
<#--        <div class="alert"> No trains found! </div> TODO rewrite-->
    </#if>


</@c.page>