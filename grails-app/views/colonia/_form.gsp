<%@ page import="org.valledelbit.sip.Colonia" %>



<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'noColonia', 'error')} required">
	<label for="noColonia">
		<g:message code="colonia.noColonia.label" default="No Colonia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noColonia" maxlength="25" required="" value="${coloniaInstance?.noColonia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="colonia.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${coloniaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: coloniaInstance, field: 'municipio', 'error')} required">
	<label for="municipio">
		<g:message code="colonia.municipio.label" default="Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipio" name="municipio.id" from="${org.valledelbit.sip.Municipio.list()}" optionKey="id" required="" value="${coloniaInstance?.municipio?.id}" class="many-to-one"/>
</div>

