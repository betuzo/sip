
<%@ page import="org.valledelbit.sip.PredioValor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predioValor.label', default: 'PredioValor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-predioValor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-predioValor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noPredioValor" title="${message(code: 'predioValor.noPredioValor.label', default: 'No Predio Valor')}" />
					
						<g:sortableColumn property="a–o" title="${message(code: 'predioValor.a–o.label', default: 'A–o')}" />
					
						<g:sortableColumn property="valorFiscal" title="${message(code: 'predioValor.valorFiscal.label', default: 'Valor Fiscal')}" />
					
						<g:sortableColumn property="valorCatastral" title="${message(code: 'predioValor.valorCatastral.label', default: 'Valor Catastral')}" />
					
						<g:sortableColumn property="valorComercial" title="${message(code: 'predioValor.valorComercial.label', default: 'Valor Comercial')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${predioValorInstanceList}" status="i" var="predioValorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${predioValorInstance.id}">${fieldValue(bean: predioValorInstance, field: "noPredioValor")}</g:link></td>
					
						<td><g:formatDate date="${predioValorInstance.a–o}" /></td>
					
						<td>${fieldValue(bean: predioValorInstance, field: "valorFiscal")}</td>
					
						<td>${fieldValue(bean: predioValorInstance, field: "valorCatastral")}</td>
					
						<td>${fieldValue(bean: predioValorInstance, field: "valorComercial")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${predioValorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
