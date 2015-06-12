<%@ page import="org.rescate.Imagen" %>



<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload">
		<g:message code="imagen.filePayload.label" default="File Payload" />
		
	</label>
	<input type="file" id="filePayload" name="filePayload" />

</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'fileType', 'error')} ">
	<label for="fileType">
		<g:message code="imagen.fileType.label" default="File Type" />
		
	</label>
	<g:textField name="fileType" value="${imagenInstance?.fileType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'fileName', 'error')} ">
	<label for="fileName">
		<g:message code="imagen.fileName.label" default="File Name" />
		
	</label>
	<g:textField name="fileName" value="${imagenInstance?.fileName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: imagenInstance, field: 'animal', 'error')} required">
	<label for="animal">
		<g:message code="imagen.animal.label" default="Animal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="animal" name="animal.id" from="${org.rescate.Animal.list()}" optionKey="id" required="" value="${imagenInstance?.animal?.id}" class="many-to-one"/>

</div>

