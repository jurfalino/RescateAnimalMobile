<%@ page import="org.rescate.AnimalEvent" %>



<div class="fieldcontain ${hasErrors(bean: animalEventInstance, field: 'eventType', 'error')} required">
	<label for="eventType">
		<g:message code="animalEvent.eventType.label" default="Event Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="eventType" from="${animalEventInstance.constraints.eventType.inList}" required="" value="${animalEventInstance?.eventType}" valueMessagePrefix="animalEvent.eventType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalEventInstance, field: 'eventDate', 'error')} required">
	<label for="eventDate">
		<g:message code="animalEvent.eventDate.label" default="Event Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="eventDate" precision="day"  value="${animalEventInstance?.eventDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalEventInstance, field: 'comments', 'error')} required">
	<label for="comments">
		<g:message code="animalEvent.comments.label" default="Comments" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comments" required="" value="${animalEventInstance?.comments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: animalEventInstance, field: 'animal', 'error')} required">
	<label for="animal">
		<g:message code="animalEvent.animal.label" default="Animal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="animal" name="animal.id" from="${org.rescate.Animal.list()}" optionKey="id" required="" value="${animalEventInstance?.animal?.id}" class="many-to-one"/>

</div>

