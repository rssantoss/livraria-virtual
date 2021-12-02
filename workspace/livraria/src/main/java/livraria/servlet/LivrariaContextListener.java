package livraria.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import livraria.negocio.Livraria;

@WebListener
public final class LivrariaContextListener implements ServletContextListener{

    public static final String SISTEMA_LIVRARIA="sistemaLivraria";

    public void contextInitialized(ServletContextEvent event) {

        ServletContext context = event.getServletContext();

        try {
            Livraria livraria = new Livraria();
            context.setAttribute(SISTEMA_LIVRARIA, livraria);
        } catch (Exception ex){
            System.out.println("O sistema de livraria não pode ser publicado no contexto." + ex.getMessage());
        }
    }

    public void contextDestroyed(ServletContextEvent event){
        ServletContext context = event.getServletContext();

        Livraria livraria = (Livraria) context.getAttribute(SISTEMA_LIVRARIA);

        if(livraria != null){
            livraria.fechar();
        }

        context.removeAttribute(SISTEMA_LIVRARIA);
    }
}