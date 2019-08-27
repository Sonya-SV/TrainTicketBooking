<#import "parts/common.ftl" as c>
<#import "/spring.ftl" as spring/>
<@c.page>
    <#if trains??>
    <table class="table table-bordered  table-hover table-sm" style=" margin: auto;">
    <tr>
        <th><@spring.message "number"/></th>
        <th><@spring.message "from"/>/<@spring.message "to"/></th>
        <th><@spring.message "departure.date"/>/<@spring.message "arrival.date"/>
        </th>
        <th><@spring.message "time"/>
        </th>
        <th><@spring.message "free.seats"/></th>
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
                <td>${train.freePlaces!}/${train.totalPlaces} <a href="/tickets/${train.id}"> <@spring.message "choose"/></a></td>
            </tr>
        </#list>
    </table>
        <#else>
<#--        <div class="alert"> No trains found! </div> TODO rewrite-->
    </#if>


</@c.page>