
<%@ page import="org.rescate.Animal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-animal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-animal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list animal">
			
				<g:if test="${animalInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="animal.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${animalInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.especie}">
				<li class="fieldcontain">
					<span id="especie-label" class="property-label"><g:message code="animal.especie.label" default="Especie" /></span>
					
						<span class="property-value" aria-labelledby="especie-label"><g:fieldValue bean="${animalInstance}" field="especie"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="animal.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${animalInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.pelo}">
				<li class="fieldcontain">
					<span id="pelo-label" class="property-label"><g:message code="animal.pelo.label" default="Pelo" /></span>
					
						<span class="property-value" aria-labelledby="pelo-label"><g:fieldValue bean="${animalInstance}" field="pelo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.raza}">
				<li class="fieldcontain">
					<span id="raza-label" class="property-label"><g:message code="animal.raza.label" default="Raza" /></span>
					
						<span class="property-value" aria-labelledby="raza-label"><g:fieldValue bean="${animalInstance}" field="raza"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.dateOfBirth}">
				<li class="fieldcontain">
					<span id="dateOfBirth-label" class="property-label"><g:message code="animal.dateOfBirth.label" default="Date Of Birth" /></span>
					
						<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${animalInstance?.dateOfBirth}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.dateOfIntake}">
				<li class="fieldcontain">
					<span id="dateOfIntake-label" class="property-label"><g:message code="animal.dateOfIntake.label" default="Date Of Intake" /></span>
					
						<span class="property-value" aria-labelledby="dateOfIntake-label"><g:formatDate date="${animalInstance?.dateOfIntake}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.dateNeutered}">
				<li class="fieldcontain">
					<span id="dateNeutered-label" class="property-label"><g:message code="animal.dateNeutered.label" default="Date Neutered" /></span>
					
						<span class="property-value" aria-labelledby="dateNeutered-label"><g:formatDate date="${animalInstance?.dateNeutered}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.eventos}">
				<li class="fieldcontain">
					<span id="eventos-label" class="property-label"><g:message code="animal.eventos.label" default="Eventos" /></span>
					
						<g:each in="${animalInstance.eventos}" var="e">
						<span class="property-value" aria-labelledby="eventos-label"><g:link controller="animalEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${animalInstance?.imagenes}">
				<li class="fieldcontain">
					<span id="imagenes-label" class="property-label"><g:message code="animal.imagenes.label" default="Imagenes" /></span>
					
						<g:each in="${animalInstance.imagenes}" var="i">
						<span class="property-value" aria-labelledby="imagenes-label"><g:link controller="imagen" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:animalInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${animalInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
