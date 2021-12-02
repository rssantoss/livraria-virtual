<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-BR">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="../_style/estilo_geral.css">
	    <link rel="shortcut icon" href="../_image/logo.png">
	    <title>Livraria Propera</title>
	</head>
	
	<body>
		<div>
			<figure class="circle">
				<img src="../_image/logo.png" title="logo" alt="Foto/simbolo"/>
		    </figure>
		</div>
		<br>
		<hr>
	
		<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
		    <jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
		</jsp:useBean>
		<div class="centralizar">
		<c:if test="${!empty param.idLivro}">
		    <c:set var="id" value="${param.idLivro}"/>
		    <jsp:setProperty name="livrariaBean" property="idLivro" value="${id}" />
		    <c:set var="livro" value="${livrariaBean.livro}" />
		
		    <h2>${livro.titulo}</h2>
		    <h4>Autor: </h4>  <em> ${livro.autores} (${livro.ano})</em>
		    <br>   <br>
		    <h4>Descricao: </h4>
		    <blockquote>${livro.descricao}</blockquote>
		    <h4>Preco: <fmt:formatNumber value="${livro.preco}" type="currency"/></h4>
		
		    <c:url var="url" value="/livros/catalogo" >
		        <c:param name="Add" value="${id}" />
		    </c:url>
		    <p><strong><a class="esvaziar" href="${url}">Adicionar ao carrinho</a>
		</c:if>
		
		<c:url var="url" value="/livros/catalogo" >
		    <c:param name="Add" value="" />
		</c:url>
		<a class="comprar" href="${url}">Continuar comprando</a></strong></p>
		</div>
		<br>
		
		<footer><hr>Copyright 2021 Livraria Prospera</footer>
	</body>
</html>