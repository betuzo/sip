<%@ page import="org.valledelbit.sip.Estado" %>



<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'noEstado', 'error')} required">
	<label for="noEstado">
		<g:message code="estado.noEstado.label" default="No Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noEstado" maxlength="25" required="" value="${estadoInstance?.noEstado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: estadoInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="estado.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="estado" maxlength="50" required="" value="${estadoInstance?.estado}"/>
</div>

