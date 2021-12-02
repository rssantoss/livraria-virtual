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
		
		<jsp:useBean id="livrariaBean" class="livraria.negocio.LivrariaBean" scope="page" >
		    <jsp:setProperty name="livrariaBean" property="sistema" value="${sistemaLivraria}" />
		</jsp:useBean>
		
		<header>
			<h3> Livros disponíveis para compra: </h3>
		</header>
		<div class="center">
		    <table summary="layout">
		        <c:forEach var="livro" begin="0" items="${livrariaBean.livros}">
		            <tr>
		                <c:set var="idLivro" value="${livro.idLivro}" />
		                <td class="tdLivro">
		                    <c:url var="url" value="/livros/detalhesLivro" >
		                        <c:param name="idLivro" value="${idLivro}"/>
		                    </c:url>
		                    <a href="${url}"><strong>${livro.titulo}</strong></a>
		                </td>
		                <td class="tdPreco" rowspan=2>
		                    <fmt:formatNumber value="${livro.preco}" type="currency"/>
		                </td>
		                <td class="tdAdd" rowspan=2>
		                    <c:url var="url" value="/livros/catalogo" >
		                        <c:param name="Add" value="${idLivro}"/>
		                    </c:url>
		                    <a href="${url}">Adicionar livro ao carrinho</a>
		                </td>
		            </tr>
		            <tr>
		                <td class="tdAutor">
		                    <em>${livro.autores} </em>
		                </td>
		            </tr>
		        </c:forEach>
		    </table>
		</div>

		<br>

		<div>
		<div id="menu">
			<c:if test="${not empty param.Add}">
		        <c:set var="idL" value="${param.Add}"/>
		        <jsp:setProperty name="livrariaBean" property="idLivro" value="${idL}" />
		        <c:set var="livroAdicionado" value="${livrariaBean.livro}" />
		        <h3>
		            <font color="red" size="+2">Voce adicionou o livro <em>${livroAdicionado.titulo}</em> ao seu carrinho de compras.</font>
		    	</h3>
		    </c:if>

            <c:url var="url" value="/livros/mostrarCarrinho">
                <c:param name="limpar" value="0"/>
                <c:param name="remover" value="0"/>
            </c:url>
            <p>
                <a class="comprar" href="${url}">Ver carrinho de compras</a>
                <c:url var="url" value="/livros/comprar" />
                <a class="finalizar" href="${url}">Finalizar compras</a>
        	</p>
		</div>
		</div>
		<br>
	
		<footer><hr><br>Copyright 2021 Livraria Prospera</footer>
	</body>
</html>
