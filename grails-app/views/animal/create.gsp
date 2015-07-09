<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'animal.label', default: 'Animal')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script>
		//window.onload = setInterval(function(){
		//	  var form = $('#my-form-id');
		//	  var method = form.attr('method').toLowerCase();      // "get" or "post"
		//	  var action = '/RescateAnimalMobile/animal/createAnimalEvent';//form.attr('action');                    // url to submit to
			  //alert(method+' - '+action);
		//	  var posting = $[method](action, form.serialize(), function(data){
			    // Do something with the server response data      
			    // Or at least let the user know it saved
				    //alert(data);
		//	  });
		//	},1000);                        // do it every 1 seconds                                            
		</script>
	</head>
	<body>
		<a href="#create-animal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-animal" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${animalInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${animalInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:formRemote url="[resource:animalInstance, action:'save']" name='myformid'>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:formRemote>
		</div>
	</body>
</html>
