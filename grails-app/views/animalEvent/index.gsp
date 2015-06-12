
<%@ page import="org.rescate.AnimalEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'animalEvent.label', default: 'AnimalEvent')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-animalEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-animalEvent" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="eventType" title="${message(code: 'animalEvent.eventType.label', default: 'Event Type')}" />
					
						<g:sortableColumn property="eventDate" title="${message(code: 'animalEvent.eventDate.label', default: 'Event Date')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'animalEvent.comments.label', default: 'Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${animalEventInstanceList}" status="i" var="animalEventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${animalEventInstance.id}">${fieldValue(bean: animalEventInstance, field: "eventType")}</g:link></td>
					
						<td><g:formatDate date="${animalEventInstance.eventDate}" /></td>
					
						<td>${fieldValue(bean: animalEventInstance, field: "comments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${animalEventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
