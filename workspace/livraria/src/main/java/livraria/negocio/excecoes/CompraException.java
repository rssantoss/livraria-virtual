package livraria.negocio.excecoes;

public class CompraException extends Exception {

    private static final long SerialVersionUID=1L;

    public CompraException(){
    }

    public CompraException(String msg){
        super(msg);
    }
}
