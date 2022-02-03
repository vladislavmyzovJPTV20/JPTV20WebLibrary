<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <h2 class="w-100 d-flex justify-content-center my-5">Список авторов</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <c:forEach var="author" items="${authors}">
            <div class="card border-primary m-3" style="max-width: 20rem;">
              <div class="card-header">${author.firstname} ${author.lastname}</div>
              <div class="card-body">
                <h4 class="card-title">Год рождения: ${author.birthYear}</h4>
              </div>
            </div>
        </c:forEach>
    </div>
</div>
