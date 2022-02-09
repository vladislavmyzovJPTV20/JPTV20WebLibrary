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
                <div class="mb-3">
                    <label for="bookName" class="form-label">Название книги</label>
                    <input type="text" class="form-control" name="bookName" id="bookName" aria-describedby="" value="${bookName}">
                    <div id="bookName" hidden class="form-text">error</div>
                    <input type="text" class="form-control" hidden name="id" id="id" value="${id}">
                </div>
                <div class="mb-3">
                    <label for="authors" class="form-label">Авторы</label>
                    <select name="authors"  id="authors" multiple class="form-select" aria-label="Default select example">
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                        </c:forEach>
                    </select>
                </div>
                        <input type="submit" name="Редактировать" class="btn btn-success mb-3">
            </form>
</div>
</div>






