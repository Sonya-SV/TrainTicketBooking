<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container" style="padding-top: 10%">

        <form method="post">
            <input type="text" name="tag" placeholder="Tag">
            <br><textarea name="message" cols="40" rows="3" placeholder="Put your message"></textarea>
            <#--            <input type="text" name="message" placeholder="Put your message"/>-->
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <br>
            <button type="submit">Add</button>
        </form>

        <form method="get" action="/main">
            <input type="text" name="tag" placeholder="Tag" ">
            <button type="submit">Find</button>
        </form>

        <div class="col-md-6 col-md-offset-3" style="padding-top: 50px">
            <table class="table table-bordered">
                <tr>
                    <th>Id</th>
                    <th>Message</th>
                    <th>Tag</th>
                    <th>Author</th>
                </tr>

                <#if notes??>
                    <#list notes as note>
                        <tr>
                            <td>${note.id}</td>
                            <td>${note.message}</td>
                            <td>${note.tag}</td>
                            <td>${note.authorName}</td>
                        </tr>
                    </#list>
                </#if>


            </table>
        </div>

    </div>
</@c.page>