<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Home Page</title>
</head>
<body>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>Welcome ${name}!</h1>
        <g:if test="${flash.message}">
            <h4>${flash.message}</h4>
        </g:if>

        <ul><g:each in="${notes}" var="note">
            <li>
                <g:link controller="baseNote" action="show" id="${note.id}">
                    ${note.class} - ${note.content}
                </g:link>
            </li>
        </g:each></ul>
    </section>
</div>

</body>
</html>