<%@ page import="org.valledelbit.sip.PredioValor" %>



<div class="fieldcontain ${hasErrors(bean: predioValorInstance, field: 'noPredioValor', 'error')} required">
	<label for="noPredioValor">
		<g:message code="predioValor.noPredioValor.label" default="No Predio Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPredioValor" maxlength="10" required="" value="${predioValorInstance?.noPredioValor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioValorInstance, field: 'a–o', 'error')} required">
	<label for="a–o">
		<g:message code="predioValor.a–o.label" default="A–o" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="a–o" precision="day"  value="${predioValorInstance?.a–o}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: predioValorInstance, field: 'valorFiscal', 'error')} required">
	<label for="valorFiscal">
		<g:message code="predioValor.valorFiscal.label" default="Valor Fiscal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="valorFiscal" required="" value="${fieldValue(bean: predioValorInstance, field: 'valorFiscal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioValorInstance, field: 'valorCatastral', 'error')} required">
	<label for="valorCatastral">
		<g:message code="predioValor.valorCatastral.label" default="Valor Catastral" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="valorCatastral" required="" value="${fieldValue(bean: predioValorInstance, field: 'valorCatastral')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioValorInstance, field: 'valorComercial', 'error')} required">
	<label for="valorComercial">
		<g:message code="predioValor.valorComercial.label" default="Valor Comercial" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="valorComercial" required="" value="${fieldValue(bean: predioValorInstance, field: 'valorComercial')}"/>
</div>

