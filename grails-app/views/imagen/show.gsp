
<%@ page import="org.rescate.Imagen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-imagen" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list imagen">
			
				<g:if test="${imagenInstance?.filePayload}">
				<li class="fieldcontain">
					<span id="filePayload-label" class="property-label"><g:message code="imagen.filePayload.label" default="File Payload" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.fileType}">
				<li class="fieldcontain">
					<span id="fileType-label" class="property-label"><g:message code="imagen.fileType.label" default="File Type" /></span>
					
						<span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${imagenInstance}" field="fileType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="imagen.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${imagenInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${imagenInstance?.animal}">
				<li class="fieldcontain">
					<span id="animal-label" class="property-label"><g:message code="imagen.animal.label" default="Animal" /></span>
					
						<span class="property-value" aria-labelledby="animal-label"><g:link controller="animal" action="show" id="${imagenInstance?.animal?.id}">${imagenInstance?.animal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:imagenInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${imagenInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
