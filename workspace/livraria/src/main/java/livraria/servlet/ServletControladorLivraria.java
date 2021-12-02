package livraria.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import livraria.negocio.CarrinhoCompras;
import livraria.negocio.Livraria;
import livraria.negocio.Livro;
import livraria.negocio.excecoes.CompraException;
import livraria.negocio.excecoes.LivroNaoEncontradoException;


@WebServlet(name="Controlador", urlPatterns={"/livros/livraria","/livros/catalogo", "/livros/detalhesLivro","/livros/mostrarCarrinho","/livros/comprar","/livros/recibo"})

public class ServletControladorLivraria extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response){
        String idLivro = null;
        String limpar = null;
        Livro livro = null;

        Livraria livraria = (Livraria) getServletContext().getAttribute(LivrariaContextListener.SISTEMA_LIVRARIA);
        HttpSession session = request.getSession();

        CarrinhoCompras carrinho = (CarrinhoCompras) session.getAttribute("cart");

        if(carrinho == null){
            carrinho = new CarrinhoCompras();
            session.setAttribute("cart", carrinho);
        }

        String acaoSelecionada = request.getServletPath();

        if (acaoSelecionada.equals("/livros/catalogo")) {
            idLivro = request.getParameter("Add");
            if (!idLivro.equals("")) {
                try {
                    livro = livraria.getLivro(idLivro);
                    carrinho.adicionar(livro);
                } catch (LivroNaoEncontradoException ex) {
                    // isso não deve acontecer
                }
            }
        }

        else if (acaoSelecionada.equals("/livros/mostrarCarrinho")) {
            idLivro = request.getParameter("remover");
            if (idLivro != null) {
                carrinho.remover(idLivro);
            }
            limpar = request.getParameter("limpar");
            if ((limpar != null) && limpar.equals("limpar")) {
                carrinho.limpar();
            }
            idLivro = request.getParameter("alterar");
            if (idLivro != null) {
                int quantidade = Integer.parseInt(request.getParameter("quantidade"));
                if(quantidade == 1){
                    carrinho.aumentarQuantidade(idLivro);
                }
        else if(quantidade == -1){
                    carrinho.diminuirQuantidade(idLivro);
                }

            }
        }


        else if (acaoSelecionada.equals("/livros/recibo")) {
            try {
                livraria.comprarLivros(carrinho);
            } catch (CompraException ex) {
                ex.printStackTrace();
            }
        }


        // Aqui entram as operações do sistema

        String tela = acaoSelecionada + ".jsp";

        try {
            request.getRequestDispatcher(tela).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response){
        doGet(request, response);
    }
}
