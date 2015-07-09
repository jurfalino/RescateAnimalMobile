
<%@ page import="org.rescate.AnimalEvent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'animalEvent.label', default: 'AnimalEvent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-animalEvent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-animalEvent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list animalEvent">
			
				<g:if test="${animalEventInstance?.eventType}">
				<li class="fieldcontain">
					<span id="eventType-label" class="property-label"><g:message code="animalEvent.eventType.label" default="Event Type" /></span>
					
						<span class="property-value" aria-labelledby="eventType-label"><g:fieldValue bean="${animalEventInstance}" field="eventType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalEventInstance?.eventDate}">
				<li class="fieldcontain">
					<span id="eventDate-label" class="property-label"><g:message code="animalEvent.eventDate.label" default="Event Date" /></span>
					
						<span class="property-value" aria-labelledby="eventDate-label"><g:formatDate date="${animalEventInstance?.eventDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalEventInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="animalEvent.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${animalEventInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalEventInstance?.animal}">
				<li class="fieldcontain">
					<span id="animal-label" class="property-label"><g:message code="animalEvent.animal.label" default="Animal" /></span>
					
						<span class="property-value" aria-labelledby="animal-label"><g:link controller="animal" action="show" id="${animalEventInstance?.animal?.id}">${animalEventInstance?.animal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:animalEventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${animalEventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
