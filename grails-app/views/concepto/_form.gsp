<%@ page import="org.valledelbit.sip.Concepto" %>



<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'noCocepto', 'error')} required">
	<label for="noCocepto">
		<g:message code="concepto.noCocepto.label" default="No Cocepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noCocepto" maxlength="10" required="" value="${conceptoInstance?.noCocepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'descripcionConcepto', 'error')} ">
	<label for="descripcionConcepto">
		<g:message code="concepto.descripcionConcepto.label" default="Descripcion Concepto" />
		
	</label>
	<g:textField name="descripcionConcepto" maxlength="100" value="${conceptoInstance?.descripcionConcepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'noCuentaNOI', 'error')} required">
	<label for="noCuentaNOI">
		<g:message code="concepto.noCuentaNOI.label" default="No Cuenta NOI" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noCuentaNOI" maxlength="25" required="" value="${conceptoInstance?.noCuentaNOI}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'dependencia', 'error')} required">
	<label for="dependencia">
		<g:message code="concepto.dependencia.label" default="Dependencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dependencia" name="dependencia.id" from="${org.valledelbit.sip.Dependencia.list()}" optionKey="id" required="" value="${conceptoInstance?.dependencia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conceptoInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="concepto.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="precio" maxlength="25" required="" value="${conceptoInstance?.precio}"/>
</div>

