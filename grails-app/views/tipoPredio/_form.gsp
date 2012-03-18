<%@ page import="org.valledelbit.sip.TipoPredio" %>



<div class="fieldcontain ${hasErrors(bean: tipoPredioInstance, field: 'noTipoPredio', 'error')} required">
	<label for="noTipoPredio">
		<g:message code="tipoPredio.noTipoPredio.label" default="No Tipo Predio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noTipoPredio" maxlength="10" required="" value="${tipoPredioInstance?.noTipoPredio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tipoPredioInstance, field: 'descripcionTipoPredio', 'error')} ">
	<label for="descripcionTipoPredio">
		<g:message code="tipoPredio.descripcionTipoPredio.label" default="Descripcion Tipo Predio" />
		
	</label>
	<g:textField name="descripcionTipoPredio" maxlength="100" value="${tipoPredioInstance?.descripcionTipoPredio}"/>
</div>

