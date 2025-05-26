package web;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CuentoServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String nombre = request.getParameter("nombre");
    String apodo = request.getParameter("apodo");
    String cabello = request.getParameter("cabello");
    String ojos = request.getParameter("ojos");
    String edad = request.getParameter("edad");
    String hobby = request.getParameter("hobby");
    
    
String cuento = "En una ciudad no muy lejana vivía <strong>" + nombre + "</strong>, aunque todos lo conocían como <strong>\"" + apodo + "\"</strong>. "
    + "<strong>" + apodo + "</strong> era una persona curiosa, con el cabello <strong>" + cabello + "</strong> que brillaba bajo el sol y unos ojos <strong>" + ojos + "</strong> "
    + "que reflejaban la pasión por descubrir el mundo. A sus <strong>" + edad + "</strong> años, su pasatiempo favorito era <strong>" + hobby + "</strong>, "
    + "una actividad que le daba paz, inspiración y propósito.<br><br>"

    + "Cada mañana, después de tomar una taza de café caliente, <strong>" + apodo + "</strong> salía a recorrer su barrio en busca de algo nuevo que le despertara la imaginación. "
    + "Un día, mientras practicaba <strong>" + hobby + "</strong>, encontró una vieja libreta escondida bajo una banca del parque. En sus páginas había dibujos extraños, pistas misteriosas y una nota que decía: "
    + "\"<em>Solo quien tenga el corazón curioso podrá descubrir el secreto de este lugar</em>\".<br><br>"

    + "Movido por la intriga, <strong>" + apodo + "</strong> emprendió una pequeña aventura que lo llevó a conocer personas increíbles, rincones ocultos de su ciudad y, sobre todo, a conocerse mejor a sí mismo. "
    + "Desde ese momento, su vida no volvió a ser la misma, y entendió que los verdaderos cuentos no se leen… <strong>se viven</strong>.";


    // Guardar el cuento en sesión
    HttpSession sesion = request.getSession();
    sesion.setAttribute("cuentoGenerado", cuento);

    // Redirigir a index.jsp con el parámetro de resultadoCuento
    response.sendRedirect("index.jsp?pagina=resultadoCuento");
  }
}
