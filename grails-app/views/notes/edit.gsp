<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Edit Note</title>
    </head>
    <body>
        <div class="container" role="main">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.baseNote}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.baseNote}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:form action="update" method="post">
                <div class="${note.class.toString().minus("class notesapp.").toLowerCase()}">

                    <g:if test="${note.class.toString() == 'class notesapp.Codeblock'}">
                        <g:textArea name="content" value="${note.content}" rows="8" style="font-family: monospace"/>
                    </g:if>
                    <g:else>
                        <g:textArea name="content" value="${note.content}" rows="8"/>
                    </g:else>


                    <g:if test="${note.class.toString() != 'class notesapp.Note'}">
                        <g:if test="${note.class.toString() == 'class notesapp.Todo'}">
                            <g:hiddenField name="additional" value="false" />
                        </g:if>
                        <g:else>
                            <g:textField name="additional" value="${note.additional}" />
                        </g:else>
                    </g:if>
                    <g:hiddenField name="id" value="${note.id}" />
                    <g:submitButton name="update" value="Update" />
                </div>
            </g:form>
        </div>
    </body>
</html>
