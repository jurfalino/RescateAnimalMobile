<%@ page import="org.rescate.Animal" %>



<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="animal.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${animalInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'especie', 'error')} required">
	<label for="especie">
		<g:message code="animal.especie.label" default="Especie" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="especie" from="${animalInstance.constraints.especie.inList}" required="" value="${animalInstance?.especie}" valueMessagePrefix="animal.especie"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'color', 'error')} required">
	<label for="color">
		<g:message code="animal.color.label" default="Color" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="color" from="${animalInstance.constraints.color.inList}" required="" value="${animalInstance?.color}" valueMessagePrefix="animal.color"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'pelo', 'error')} required">
	<label for="pelo">
		<g:message code="animal.pelo.label" default="Pelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="pelo" from="${animalInstance.constraints.pelo.inList}" required="" value="${animalInstance?.pelo}" valueMessagePrefix="animal.pelo"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'raza', 'error')} required">
	<label for="raza">
		<g:message code="animal.raza.label" default="Raza" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="raza" from="${animalInstance.constraints.raza.inList}" required="" value="${animalInstance?.raza}" valueMessagePrefix="animal.raza"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="animal.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${animalInstance?.dateOfBirth}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'dateOfIntake', 'error')} required">
	<label for="dateOfIntake">
		<g:message code="animal.dateOfIntake.label" default="Date Of Intake" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfIntake" precision="day"  value="${animalInstance?.dateOfIntake}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'dateNeutered', 'error')} required">
	<label for="dateNeutered">
		<g:message code="animal.dateNeutered.label" default="Date Neutered" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateNeutered" precision="day"  value="${animalInstance?.dateNeutered}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'eventos', 'error')} ">
	<label for="eventos">
		<g:message code="animal.eventos.label" default="Eventos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${animalInstance?.eventos?}" var="e">
    <li><g:link controller="animalEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="animalEvent" action="create" params="['animal.id': animalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'animalEvent.label', default: 'AnimalEvent')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'imagenes', 'error')} ">
	<label for="imagenes">
		<g:message code="animal.imagenes.label" default="Imagenes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${animalInstance?.imagenes?}" var="i">
    <li><g:link controller="imagen" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="imagen" action="create" params="['animal.id': animalInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'imagen.label', default: 'Imagen')])}</g:link>
</li>
</ul>


</div>

