
<%@ page import="org.rescate.Adoptante" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'adoptante.label', default: 'Adoptante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-adoptante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-adoptante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list adoptante">
			
				<g:if test="${adoptanteInstance?.firstname}">
				<li class="fieldcontain">
					<span id="firstname-label" class="property-label"><g:message code="adoptante.firstname.label" default="Firstname" /></span>
					
						<span class="property-value" aria-labelledby="firstname-label"><g:fieldValue bean="${adoptanteInstance}" field="firstname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.lastname}">
				<li class="fieldcontain">
					<span id="lastname-label" class="property-label"><g:message code="adoptante.lastname.label" default="Lastname" /></span>
					
						<span class="property-value" aria-labelledby="lastname-label"><g:fieldValue bean="${adoptanteInstance}" field="lastname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.documentNum}">
				<li class="fieldcontain">
					<span id="documentNum-label" class="property-label"><g:message code="adoptante.documentNum.label" default="Document Num" /></span>
					
						<span class="property-value" aria-labelledby="documentNum-label"><g:fieldValue bean="${adoptanteInstance}" field="documentNum"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.documentType}">
				<li class="fieldcontain">
					<span id="documentType-label" class="property-label"><g:message code="adoptante.documentType.label" default="Document Type" /></span>
					
						<span class="property-value" aria-labelledby="documentType-label"><g:fieldValue bean="${adoptanteInstance}" field="documentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.facebook}">
				<li class="fieldcontain">
					<span id="facebook-label" class="property-label"><g:message code="adoptante.facebook.label" default="Facebook" /></span>
					
						<span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${adoptanteInstance}" field="facebook"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="adoptante.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${adoptanteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.houseType}">
				<li class="fieldcontain">
					<span id="houseType-label" class="property-label"><g:message code="adoptante.houseType.label" default="House Type" /></span>
					
						<span class="property-value" aria-labelledby="houseType-label"><g:fieldValue bean="${adoptanteInstance}" field="houseType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.color}">
				<li class="fieldcontain">
					<span id="color-label" class="property-label"><g:message code="adoptante.color.label" default="Color" /></span>
					
						<span class="property-value" aria-labelledby="color-label"><g:fieldValue bean="${adoptanteInstance}" field="color"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.especie}">
				<li class="fieldcontain">
					<span id="especie-label" class="property-label"><g:message code="adoptante.especie.label" default="Especie" /></span>
					
						<span class="property-value" aria-labelledby="especie-label"><g:fieldValue bean="${adoptanteInstance}" field="especie"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.castrado}">
				<li class="fieldcontain">
					<span id="castrado-label" class="property-label"><g:message code="adoptante.castrado.label" default="Castrado" /></span>
					
						<span class="property-value" aria-labelledby="castrado-label"><g:fieldValue bean="${adoptanteInstance}" field="castrado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.country}">
				<li class="fieldcontain">
					<span id="country-label" class="property-label"><g:message code="adoptante.country.label" default="Country" /></span>
					
						<span class="property-value" aria-labelledby="country-label"><g:fieldValue bean="${adoptanteInstance}" field="country"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.edad}">
				<li class="fieldcontain">
					<span id="edad-label" class="property-label"><g:message code="adoptante.edad.label" default="Edad" /></span>
					
						<span class="property-value" aria-labelledby="edad-label"><g:fieldValue bean="${adoptanteInstance}" field="edad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.housePhone}">
				<li class="fieldcontain">
					<span id="housePhone-label" class="property-label"><g:message code="adoptante.housePhone.label" default="House Phone" /></span>
					
						<span class="property-value" aria-labelledby="housePhone-label"><g:fieldValue bean="${adoptanteInstance}" field="housePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.mobilePhone}">
				<li class="fieldcontain">
					<span id="mobilePhone-label" class="property-label"><g:message code="adoptante.mobilePhone.label" default="Mobile Phone" /></span>
					
						<span class="property-value" aria-labelledby="mobilePhone-label"><g:fieldValue bean="${adoptanteInstance}" field="mobilePhone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.otherPets}">
				<li class="fieldcontain">
					<span id="otherPets-label" class="property-label"><g:message code="adoptante.otherPets.label" default="Other Pets" /></span>
					
						<span class="property-value" aria-labelledby="otherPets-label"><g:fieldValue bean="${adoptanteInstance}" field="otherPets"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="adoptante.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${adoptanteInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="adoptante.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${adoptanteInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${adoptanteInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="adoptante.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${adoptanteInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:adoptanteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${adoptanteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
