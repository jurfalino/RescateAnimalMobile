
<%@ page import="org.rescate.Adoptante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adoptante.label', default: 'Adoptante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-adoptante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-adoptante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstname" title="${message(code: 'adoptante.firstname.label', default: 'Firstname')}" />
					
						<g:sortableColumn property="lastname" title="${message(code: 'adoptante.lastname.label', default: 'Lastname')}" />
					
						<g:sortableColumn property="documentNum" title="${message(code: 'adoptante.documentNum.label', default: 'Document Num')}" />
					
						<g:sortableColumn property="documentType" title="${message(code: 'adoptante.documentType.label', default: 'Document Type')}" />
					
						<g:sortableColumn property="facebook" title="${message(code: 'adoptante.facebook.label', default: 'Facebook')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'adoptante.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${adoptanteInstanceList}" status="i" var="adoptanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${adoptanteInstance.id}">${fieldValue(bean: adoptanteInstance, field: "firstname")}</g:link></td>
					
						<td>${fieldValue(bean: adoptanteInstance, field: "lastname")}</td>
					
						<td>${fieldValue(bean: adoptanteInstance, field: "documentNum")}</td>
					
						<td>${fieldValue(bean: adoptanteInstance, field: "documentType")}</td>
					
						<td>${fieldValue(bean: adoptanteInstance, field: "facebook")}</td>
					
						<td>${fieldValue(bean: adoptanteInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${adoptanteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
