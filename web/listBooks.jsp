<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div>
    <h2 class="w-100 d-flex justify-content-center my-5">Список книг</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <c:forEach var="book" items="${books}">
            <div class="card border-primary m-3" style="max-width: 20rem;">
              <div class="card-header">${book.bookName}</div>
              <div class="card-body">
                <h4 class="card-title">Авторы:
                    <c:forEach var="author" items="${book.author}">
                        ${author.firstname} ${author.lastname}. 
                    </c:forEach>          
                </h4>
                <p class="card-text">В наличии: ${book.count} шт.</p>
              </div>
            </div>
        </c:forEach>
    </div>
</div>
