<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="../_style/estilo_index.css">
	    <link rel="shortcut icon" href="../_image/logo.png">
	    <title>Livraria Propera</title>
	</head>
	
	<body>
		<header>
            <div id="menu">
                <a href="#">Home</a>
                <a href="#">Quem somos?</a>
                <a href="#">Livros</a>
                <a href="#">Fale conosco</a>
            </div>
    	</header>
    	
		    <div id="cabecalho">
        		<figure class="circle">
            		<img src="../_image/logo.png" title="logo" alt="Foto/simbolo"/>
        		</figure>
        		<h1>Prospera</h1>
        		<h1>Livraria Online</h1>
        	</div>
	    <c:url var="url" value="/livros/catalogo"/>
	    <p><b><a href="${url}?Add=">Iniciar compras</a></b></p>
	
		<footer>Copyright 2021 Livraria Prospera</footer>
	</body>
</html>

