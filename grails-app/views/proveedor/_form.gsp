<%@ page import="org.valledelbit.sip.Proveedor" %>



<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'noProveedor', 'error')} required">
	<label for="noProveedor">
		<g:message code="proveedor.noProveedor.label" default="No Proveedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noProveedor" maxlength="10" required="" value="${proveedorInstance?.noProveedor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'razonSocial', 'error')} required">
	<label for="razonSocial">
		<g:message code="proveedor.razonSocial.label" default="Razon Social" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="razonSocial" maxlength="50" required="" value="${proveedorInstance?.razonSocial}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="proveedor.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" maxlength="10" value="${proveedorInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="proveedor.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" maxlength="100" required="" value="${proveedorInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'nombreDelRepresentante', 'error')} required">
	<label for="nombreDelRepresentante">
		<g:message code="proveedor.nombreDelRepresentante.label" default="Nombre Del Representante" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreDelRepresentante" maxlength="100" required="" value="${proveedorInstance?.nombreDelRepresentante}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: proveedorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="proveedor.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${proveedorInstance?.email}"/>
</div>

