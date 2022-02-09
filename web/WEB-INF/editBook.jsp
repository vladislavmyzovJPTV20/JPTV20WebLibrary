<%-- 
    Document   : editBook
    Created on : 09-Feb-2022, 13:19:54
    Author     : pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100 ">
    <h2 class="w-100 d-flex justify-content-center my-5">Редактировать книгу</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <div class="" style="max-width: 30rem;min-width: 30rem"
            <form action="updateBook" method="POST">
                <div class="mb-3">
                    <label for="bookName" class="form-label">Название книги</label>
                    <input type="text" class="form-control" name="bookName" id="bookName" aria-describedby="" value="${book.bookName}">
                    <div id="bookName" hidden class="form-text">error</div>
                    <input type="text" class="form-control" hidden name="bookId" id="bookId" value="${book.id}">
                </div>
                <div class="mb-3">
                    <label for="authors" class="form-label">Авторы</label>
                    <select name="authors"  id="authors" multiple class="form-select" aria-label="Default select example">
                        <c:forEach var="author" items="${book.author}">
                            <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="publishedYear" class="form-label">Год издания</label>
                    <input type="text" class="form-control" name="publishedYear" id="publishedYear" aria-describedby="" value="${book.publishedYear}">
                    <div id="publishedYear" hidden class="form-text">error</div>
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Количество экземпляров</label>
                    <input type="text" class="form-control" name="quantity" id="quantity" aria-describedby="" value="${book.quantity}">
                    <div id="quantity" hidden class="form-text">error</div>
                </div>

                <input type="submit" name="Изменить" class="btn btn-success mb-3">
            </form>
        </div>
    </div>
</div>