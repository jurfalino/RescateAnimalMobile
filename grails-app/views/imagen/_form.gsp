<%@ page import="org.rescate.Imagen" %>



<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload">
		<g:message code="imagen.filePayload.label" default="File" />
	</label>
	<input type="file" id="filePayload" name="filePayload" />
</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'animal', 'error')} required">
	<label for="animal">
		<g:message code="imagen.animal.label" default="Animal -hide-" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="animal" name="animal.id" from="${org.rescate.Animal.list()}" optionKey="id" required="" value="${imagenInstance?.animal?.id}" class="many-to-one"/>
</div>

