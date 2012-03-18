<%@ page import="org.valledelbit.sip.ParametroPredial" %>



<div class="fieldcontain ${hasErrors(bean: parametroPredialInstance, field: 'noParametroPredial', 'error')} required">
	<label for="noParametroPredial">
		<g:message code="parametroPredial.noParametroPredial.label" default="No Parametro Predial" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noParametroPredial" maxlength="10" required="" value="${parametroPredialInstance?.noParametroPredial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parametroPredialInstance, field: 'anio', 'error')} required">
	<label for="anio">
		<g:message code="parametroPredial.anio.label" default="Anio" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="anio" precision="day"  value="${parametroPredialInstance?.anio}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: parametroPredialInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="parametroPredial.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tipo" maxlength="10" required="" value="${parametroPredialInstance?.tipo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parametroPredialInstance, field: 'base', 'error')} required">
	<label for="base">
		<g:message code="parametroPredial.base.label" default="Base" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="base" maxlength="10" required="" value="${parametroPredialInstance?.base}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parametroPredialInstance, field: 'impuest', 'error')} required">
	<label for="impuest">
		<g:message code="parametroPredial.impuest.label" default="Impuest" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="impuest" maxlength="10" required="" value="${parametroPredialInstance?.impuest}"/>
</div>

