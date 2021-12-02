package livraria.negocio;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import livraria.negocio.excecoes.CompraException;
import livraria.negocio.excecoes.LivroNaoEncontradoException;

public class Livraria {

    private List<Livro> estoqueLivros;
    public Livraria(){
        estoqueLivros = new ArrayList<Livro>();
        popularLivros();
        populaLivros();
    }

    private void popularLivros(){
        Livro livro = new Livro();
        livro.setIdLivro("001");
        livro.setAno(2008);
        livro.setTitulo("Head First Servlets and JSP");
        livro.setDescricao("Livro sobre Servlets e JSP");
        livro.setAutores("Bryan Basham, Kathy Sierra, Bert Bates");
        livro.setQuantidade(10);
        livro.setPreco(200.5);
        estoqueLivros.add(livro);
    }
    
    private void populaLivros(){
        Livro livro = new Livro();
        livro.setIdLivro("002");
        livro.setAno(2025);
        livro.setTitulo("Educatux, o melhor SO para estudantes");
        livro.setDescricao("Livro sobre a trajetória do melhor SO para estudantes do mundo");
        livro.setAutores("Aderbal Botelho");
        livro.setQuantidade(10);
        livro.setPreco(399.99);
        estoqueLivros.add(livro);
    }

    public List<Livro> getLivros(){
        return Collections.unmodifiableList(estoqueLivros);
    }

    public Livro getLivro(String idLivro) throws LivroNaoEncontradoException{
        Livro livroProcurado = null;
        for(Livro book : estoqueLivros){
            if(book.getIdLivro().equals(idLivro)){
                livroProcurado = book;
            }
            
            if (livroProcurado == null){
                throw new LivroNaoEncontradoException(
                        "Não foi possivel encontrar o livro: " + idLivro);
            }
        }

        return livroProcurado;
    }

    public void comprarLivros(CarrinhoCompras carrinho) throws CompraException{
        Collection<ItemCompra> items = carrinho.getItens();
        Iterator<ItemCompra> i = items.iterator();
        while(i.hasNext()){
            ItemCompra item = (ItemCompra) i.next();
            Livro livro = (Livro) item.getItem();
            String id = livro.getIdLivro();
            int quantity = item.getQuantidade();
            comprarLivro(id, quantity);
        }
    }

    public void comprarLivro(String idLivro, int qtdComprada) throws CompraException {
        Livro livroSelecionado;
        try{
            livroSelecionado = getLivro(idLivro);
        }
        catch (LivroNaoEncontradoException e){
            throw new CompraException(e.getMessage());
        }
        int qtdEstoque = livroSelecionado.getQuantidade();
        if((qtdEstoque - qtdComprada) >= 0) {
            int novaQtd = qtdEstoque - qtdComprada;
            livroSelecionado.setQuantidade(novaQtd);
        }
        
        else{
            throw new CompraException("Livro" + idLivro + "sem estoque suficiente.");
        }
    }

    public void fechar(){
    }
}
