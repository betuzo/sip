<%@ page import="org.valledelbit.sip.Predio" %>



<div class="fieldcontain ${hasErrors(bean: predioInstance, field: 'noPredio', 'error')} required">
	<label for="noPredio">
		<g:message code="predio.noPredio.label" default="No Predio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPredio" maxlength="10" required="" value="${predioInstance?.noPredio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioInstance, field: 'tipoPredio', 'error')} required">
	<label for="tipoPredio">
		<g:message code="predio.tipoPredio.label" default="Tipo Predio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoPredio" name="tipoPredio.id" from="${org.valledelbit.sip.TipoPredio.list()}" optionKey="id" required="" value="${predioInstance?.tipoPredio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioInstance, field: 'datosPred', 'error')} required">
	<label for="datosPred">
		<g:message code="predio.datosPred.label" default="Datos Pred" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="datosPred" maxlength="25" required="" value="${predioInstance?.datosPred}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioInstance, field: 'calle', 'error')} required">
	<label for="calle">
		<g:message code="predio.calle.label" default="Calle" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="calle" name="calle.id" from="${org.valledelbit.sip.Calle.list()}" optionKey="id" required="" value="${predioInstance?.calle?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioInstance, field: 'descDomicilio', 'error')} ">
	<label for="descDomicilio">
		<g:message code="predio.descDomicilio.label" default="Desc Domicilio" />
		
	</label>
	<g:textField name="descDomicilio" maxlength="50" value="${predioInstance?.descDomicilio}"/>
</div>

