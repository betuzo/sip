<%@ page import="org.valledelbit.sip.Habitante" %>



<div class="fieldcontain ${hasErrors(bean: habitanteInstance, field: 'noHabitante', 'error')} required">
	<label for="noHabitante">
		<g:message code="habitante.noHabitante.label" default="No Habitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noHabitante" maxlength="10" required="" value="${habitanteInstance?.noHabitante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: habitanteInstance, field: 'datosHabitante', 'error')} required">
	<label for="datosHabitante">
		<g:message code="habitante.datosHabitante.label" default="Datos Habitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="datosHabitante" maxlength="70" required="" value="${habitanteInstance?.datosHabitante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: habitanteInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="habitante.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="calle" name="calle.id" from="${org.valledelbit.sip.Calle.list()}" optionKey="id" required="" value="${habitanteInstance?.calle?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: habitanteInstance, field: 'descDomicilio', 'error')} ">
	<label for="descDomicilio">
		<g:message code="habitante.descDomicilio.label" default="Desc Domicilio" />
		
	</label>
	<g:textField name="descDomicilio" maxlength="100" value="${habitanteInstance?.descDomicilio}"/>
</div>

