<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container py-5">
    <h2 class="text-center fw-bold text-success mb-4">Cotización recibida</h2>

    <div class="card shadow-sm mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <p class="lead">¡Gracias <strong>${nombre}</strong> por tu solicitud!</p>

            <p><strong>Producto solicitado:</strong> ${producto}</p>
            <p><strong>Cantidad:</strong> ${cantidad}</p>

            <c:if test="${not empty comentarios}">
                <p><strong>Comentarios:</strong> ${comentarios}</p>
            </c:if>

            <hr>
            <p class="text-muted">Te contactaremos pronto con los detalles de la cotización</p>

            <a href="index.jsp" class="btn btn-outline-primary mt-3">
                Volver al inicio <i class="bi bi-house ms-2"></i>
            </a>
        </div>
    </div>
</div>
