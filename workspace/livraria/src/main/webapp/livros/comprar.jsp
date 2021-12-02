<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-BR">
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
		<p>Valor total da compra:
		  <strong>
		    <fmt:formatNumber value="${sessionScope.cart.total}" type="currency"/>
		  </strong>
		<p>Para efetuar a compra dos livros selecionados, informe os seguintes dados:
		  <c:url var="url" value="/livros/recibo" />
		<form action="${url}" method="post">
		  <table summary="layout">
		    <tr>
		      <td><strong>Nome:</strong></td>
		      <td><input type="text" name="nome" value="" size="30"></td>
		    </tr>
		    <tr>
		      <td><strong>Numero do cartao:</strong></td>
		      <td><input type="text" name="cardnum" value="xxxx xxxx xxxx xxxx" size="19"></td>
		    </tr>
		    <tr>
		      <td></td>
		      <td><input type="submit" value="Comprar"></td>
		    </tr>
		  </table>
		</form>
		<br>
		<hr>
		
		<footer>Copyright 2021 Livraria Prospera</footer>
	</body>
</html>
