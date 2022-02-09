<%-- 
    Document   : editListBooks
    Created on : 09-Feb-2022, 14:40:40
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100 ">
    <h2 class="w-100 d-flex justify-content-center my-5">Редактировать книгу</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <div class="" style="max-width: 30rem;min-width: 30rem">
            <form action="editBook" method="POST">
                <div class="mb-3">
                    <label for="bookId" class="form-label">Список книг</label>
                    <select name="bookId"  id="bookId" class="form-select" aria-label="">
                        <c:forEach var="book" items="${books}">
                            <option value="${book.id}">
                                ${book.bookName} 
                                <c:forEach var="author" items="${book.author}">
                                    ${author.firstname} ${author.lastname}. 
                                </c:forEach>
                            ${book.publishedYear}. ${book.quantity} шт.
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" name="Редактировать" class="btn btn-success mb-3">            
            </form>
        </div>
    </div>
</div>






