<%@ page import="org.rescate.Animal" %>
<%@ page import="org.rescate.AnimalEvent" %>


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

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'eventos', 'error')} ">
	<label for="eventos">
		<g:message code="animal.eventos.label" default="Eventos" />	
	</label>
	
	<ul class="one-to-many">
	<g:each in="${animalInstance?.eventos?}" var="e">
	    <li><g:link controller="animalEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
	</g:each>
	<li class="add">
	<g:remoteLink controller="animal" action="createAnimalEvent" params="${('#myformid')}.serialize()">${message(code: 'default.add.label', args: [message(code: 'animalEvent.label', default: 'AnimalEvent')])}</g:remoteLink>
	<%--<g:submitToRemote url="[controller:'animal', action:'createAnimalEvent']" value="Get The Product"/>--%></li>
	</ul>

</div>
<script type="text/javascript">
    var childCount = ${animalInstance?.eventos.size()} + 0;
    
    //This line clones the row inside the '.row' class and transforms it to plain html.
    
    //This line wraps the clonedRow and wraps it <tr> tags since cloning ignores those tags
    
    
    function addChild() {
        var htmlId = "evento" + childCount;
        var deleteIcon = "${resource(dir:'images/skin', file:'database_delete.png')}";
        var templateHtml = "<div id='" + htmlId + "' name='" + htmlId + "'>\n";
        templateHtml += "<input type='text' id='eventosList[" + childCount + "].title' name='eventosList[" + childCount + "].title' />\n";
        templateHtml += "<span onClick='$(\"#" + htmlId + "\").remove();'><img src='" + deleteIcon + "' /></span>\n";
        templateHtml += "</div>\n";
        //$("#childList").append(templateHtml);
        
        var clonedRow = $('#evento0').clone(); 
        indexItem(clonedRow, childCount);
        var removebtn = "<span onClick=\"$('#eventosList\\["+childCount+"\\]\\._deleted').val('true'); $('#evento"+childCount+"').hide()\">remove</span>";
        clonedRow.append(removebtn);
		appendRow = "<div id='" + htmlId + "' name='" + htmlId + "'>" +clonedRow.html() + '</div>';
        $("#childList").append(appendRow);
        
        childCount++;
    }
    
	/*
	 * Changes ID of every item's child by adding the index number to it.
	 */
	function indexItem(elem, num) {
        elem.children().each(function(){
        	$.each(this.attributes, function(i, attrib){
         		if(attrib.name=='id' || attrib.name=='name') {
         			attrib.value = attrib.value.replace(0,num);
             	}
      		})
        })	
  	}
  	
    function addItem(id, elem, min, max, onComplete, limitMessage, removeBtnLabel) {
    	  // checks if we have reached maximum number of elements
    	  if (!max || $('[id^=' + id + ']').length < max) {
    	    // increments the item counter
    	    var $countElem = $('#count_' + id);
    	    var num = parseInt($countElem.html()) + 1;
    	    $countElem.html(num);
    	    // creates new item and adds the index number to it
    	    var $newElem = $('<div></div>').html(elem).attr({'id' : id + num}).css('margin', '5px');
    	    // creates the "Remove" button
    	    var $removeButton = $('<input type="button"/>').appendTo($newElem);
    	    $removeButton.attr({
    	      id: 'remove_' + id,
    	      value: removeBtnLabel ? removeBtnLabel : 'Remove',
    	      disabled: 'disabled'
    	    });
    	    // binds handler to the 'click' JS event of the "Remove" button
    	    $removeButton.click(function() {
    	      removeItem(id, num, min);
    	    });
    	    // changes IDs of all elements inside new item
    	    indexItem($newElem, num);
    	    // appends new item to the parent element
    	    $('#parent_' + id).append($newElem);
    	    // enables "Remove" buttons if there are more than minimum number of elements on the page
    	    if ($('[id^=' + id + ']').length > min) {
    	      $('[id^=remove_' + id + ']').removeAttr('disabled');
    	    }
    	    // executes the 'onComplete' JS function if it exists
    	    if (window[onComplete] instanceof Function) {
    	      window[onComplete](num);
    	    }
    	  } else {
    	    // displays a message if the maximum limit is reached
    	    alert(limitMessage ? limitMessage : 'You cannot add more elements.');
    	  }
    	}

    	/*
    	 * Removes an item.
    	 */
    	function removeItem(id, num, min) {
    	  $('#' + id + num).remove();
    	  if ($('[id^=' + id + ']').length <= min) {
    	    $('[id^=remove_' + id + ']').attr('disabled', 'disabled');
    	  }
    	}

</script>
<div class="fieldcontain ${hasErrors(bean: animalEventInstance, field: 'eventos', 'error')} required">
	<label for="eventos">
		<g:message code="animal.eventos.label" default="Eventos" />
		<span class="required-indicator">*</span>
	</label>
	<div id="childList">
	<g:each var="evento" in="${animalInstance.eventos}" status="i">
		<div id="evento${i}">
		<g:hiddenField name='eventosList[${i}].id' value='${evento.id}'/>
		<g:select name="eventosList[${i}].eventType" from="${evento.constraints.eventType.inList}" required="" value="${evento.eventType}" valueMessagePrefix="animalEvent.eventType"/>
		<g:datePicker name="eventosList[${i}].eventDate" precision="day"  value="${evento.eventDate}"  />
		<g:textField name="eventosList[${i}].comments" required="" value="${evento.comments}"/>
		<input type="hidden" name='eventosList[${i}]._deleted' id='eventosList[${i}]._deleted' value='false'/>
		<span onClick="$('#eventosList\\[${i}\\]\\._deleted').val('true'); $('#evento${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
		</div>
	</g:each>
	</div>
	<input type="button" value="Add Book" onclick="addChild();" />
	<!--  input type="button" value="Add Book2" onclick="addItem(childCount++, childList, 1, 5, null, 'nomore', 'removelbl');" / -->
</div>
    

    
<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'dateNeutered', 'error')} required">
	<label for="dateNeutered">
		<g:message code="animal.dateNeutered.label" default="Date Neutered" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateNeutered" precision="day"  value="${animalInstance?.dateNeutered}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'dateOfIntake', 'error')} required">
	<label for="dateOfIntake">
		<g:message code="animal.dateOfIntake.label" default="Date Of Intake" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfIntake" precision="day"  value="${animalInstance?.dateOfIntake}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: animalInstance, field: 'edad', 'error')} required">
	<label for="edad">
		<g:message code="animal.edad.label" default="Edad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="edad" from="${animalInstance.constraints.edad.inList}" required="" value="${animalInstance?.edad}" valueMessagePrefix="animal.edad"/>

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

