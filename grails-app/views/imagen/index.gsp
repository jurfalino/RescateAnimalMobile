
<%@ page import="org.rescate.Imagen" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-imagen" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-imagen" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="filePayload" title="${message(code: 'imagen.filePayload.label', default: 'File Payload')}" />
					
						<g:sortableColumn property="fileType" title="${message(code: 'imagen.fileType.label', default: 'File Type')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'imagen.fileName.label', default: 'File Name')}" />
					
						<th><g:message code="imagen.animal.label" default="Animal" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${imagenInstanceList}" status="i" var="imagenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${imagenInstance.id}">${fieldValue(bean: imagenInstance, field: "filePayload")}</g:link></td>
					
						<td>${fieldValue(bean: imagenInstance, field: "fileType")}</td>
					
						<td>${fieldValue(bean: imagenInstance, field: "fileName")}</td>
					
						<td>${fieldValue(bean: imagenInstance, field: "animal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${imagenInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
