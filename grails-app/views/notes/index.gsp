<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Notes</title>

        <asset:stylesheet src="note.css" />
    </head>
    <body>
        <div class="container" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:each in="${notes}" var="note">
                <div class="${note.class.toString().minus("class notesapp.").toLowerCase()}">
                    <p class="time">${note.lastUpdated}</p>
                    <p class="content">${note.content}</p>

                    <g:if test="${note.class.toString() != 'class notesapp.Note'}">
                        <g:if test="${note.class.toString() == 'class notesapp.Bookmark'}">
                            <a class="additional" href="${note.additional}">${note.additional}</a>
                        </g:if>
                        <g:elseif test="${note.class.toString() == 'class notesapp.Todo'}">
                            <g:if test="${note.additional}">
                                <p class="complete">&#10004;</p>
                                <g:link action="todo" params="${[id: note.id]}">Mark Incomplete</g:link>
                            </g:if>
                            <g:else>
                                <g:link action="todo" params="${[id: note.id]}">Mark Complete</g:link>
                            </g:else>
                        </g:elseif>
                        <g:else>
                            <p class="additional">${note.additional}</p>
                        </g:else>
                    </g:if>

                    <g:link class="delete" action="delete" params="${[id: note.id]}" onclick="
                        return confirm('Are you sure?');
                    ">Delete</g:link>
                    <g:link class="edit" action="edit" params="${[id: note.id]}">Edit</g:link>
                </div>
            </g:each>
        </div>

        <script>
            const quoteDivs = document.querySelectorAll("div.quote p.content");
            const sourceDivs = document.querySelectorAll("div.quote p.additional");

            [...quoteDivs].forEach(quote => {
                quote.innerText = '"' + quote.innerText + '"';
            });
            [...sourceDivs].forEach(source => {
                source.innerText = '-' + source.innerText;
            });
        </script>
    </body>
</html>