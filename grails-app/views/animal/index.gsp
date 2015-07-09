
<%@ page import="org.rescate.Animal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-animal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-animal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'animal.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="especie" title="${message(code: 'animal.especie.label', default: 'Especie')}" />
					
						<g:sortableColumn property="color" title="${message(code: 'animal.color.label', default: 'Color')}" />
					
						<g:sortableColumn property="pelo" title="${message(code: 'animal.pelo.label', default: 'Pelo')}" />
					
						<g:sortableColumn property="raza" title="${message(code: 'animal.raza.label', default: 'Raza')}" />
					
						<g:sortableColumn property="dateNeutered" title="${message(code: 'animal.dateNeutered.label', default: 'Date Neutered')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${animalInstanceList}" status="i" var="animalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${animalInstance.id}">${fieldValue(bean: animalInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: animalInstance, field: "especie")}</td>
					
						<td>${fieldValue(bean: animalInstance, field: "color")}</td>
					
						<td>${fieldValue(bean: animalInstance, field: "pelo")}</td>
					
						<td>${fieldValue(bean: animalInstance, field: "raza")}</td>
					
						<td><g:formatDate date="${animalInstance.dateNeutered}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${animalInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
