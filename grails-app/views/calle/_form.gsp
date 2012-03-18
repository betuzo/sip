<%@ page import="org.valledelbit.sip.Calle" %>



<div class="fieldcontain ${hasErrors(bean: calleInstance, field: 'noCalle', 'error')} required">
	<label for="noCalle">
		<g:message code="calle.noCalle.label" default="No Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noCalle" maxlength="25" required="" value="${calleInstance?.noCalle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calleInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="calle.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="25" required="" value="${calleInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calleInstance, field: 'colonia', 'error')} required">
	<label for="colonia">
		<g:message code="calle.colonia.label" default="Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="colonia" name="colonia.id" from="${org.valledelbit.sip.Colonia.list()}" optionKey="id" required="" value="${calleInstance?.colonia?.id}" class="many-to-one"/>
</div>

