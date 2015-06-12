<%@ page import="org.rescate.Adoptante" %>



<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'firstname', 'error')} required">
	<label for="firstname">
		<g:message code="adoptante.firstname.label" default="Firstname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstname" required="" value="${adoptanteInstance?.firstname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'lastname', 'error')} required">
	<label for="lastname">
		<g:message code="adoptante.lastname.label" default="Lastname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastname" required="" value="${adoptanteInstance?.lastname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'documentNum', 'error')} required">
	<label for="documentNum">
		<g:message code="adoptante.documentNum.label" default="Document Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="documentNum" required="" value="${adoptanteInstance?.documentNum}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'documentType', 'error')} required">
	<label for="documentType">
		<g:message code="adoptante.documentType.label" default="Document Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="documentType" from="${adoptanteInstance.constraints.documentType.inList}" required="" value="${adoptanteInstance?.documentType}" valueMessagePrefix="adoptante.documentType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'facebook', 'error')} required">
	<label for="facebook">
		<g:message code="adoptante.facebook.label" default="Facebook" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="url" name="facebook" required="" value="${adoptanteInstance?.facebook}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="adoptante.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${adoptanteInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'houseType', 'error')} required">
	<label for="houseType">
		<g:message code="adoptante.houseType.label" default="House Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="houseType" from="${adoptanteInstance.constraints.houseType.inList}" required="" value="${adoptanteInstance?.houseType}" valueMessagePrefix="adoptante.houseType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'color', 'error')} required">
	<label for="color">
		<g:message code="adoptante.color.label" default="Color" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="color" from="${adoptanteInstance.constraints.color.inList}" required="" value="${adoptanteInstance?.color}" valueMessagePrefix="adoptante.color"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'especie', 'error')} required">
	<label for="especie">
		<g:message code="adoptante.especie.label" default="Especie" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="especie" from="${adoptanteInstance.constraints.especie.inList}" required="" value="${adoptanteInstance?.especie}" valueMessagePrefix="adoptante.especie"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'castrado', 'error')} required">
	<label for="castrado">
		<g:message code="adoptante.castrado.label" default="Castrado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="castrado" from="${adoptanteInstance.constraints.castrado.inList}" required="" value="${adoptanteInstance?.castrado}" valueMessagePrefix="adoptante.castrado"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="adoptante.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" required="" value="${adoptanteInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="adoptante.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="edad" required="" value="${adoptanteInstance?.edad}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'housePhone', 'error')} required">
	<label for="housePhone">
		<g:message code="adoptante.housePhone.label" default="House Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="housePhone" required="" value="${adoptanteInstance?.housePhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'mobilePhone', 'error')} required">
	<label for="mobilePhone">
		<g:message code="adoptante.mobilePhone.label" default="Mobile Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mobilePhone" required="" value="${adoptanteInstance?.mobilePhone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'otherPets', 'error')} required">
	<label for="otherPets">
		<g:message code="adoptante.otherPets.label" default="Other Pets" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="otherPets" required="" value="${adoptanteInstance?.otherPets}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="adoptante.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${adoptanteInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="adoptante.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${adoptanteInstance?.street}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adoptanteInstance, field: 'zip', 'error')} required">
	<label for="zip">
		<g:message code="adoptante.zip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="zip" required="" value="${adoptanteInstance?.zip}"/>

</div>

