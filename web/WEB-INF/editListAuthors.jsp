<%-- 
    Document   : editListAuthors
    Created on : 10-Feb-2022, 10:05:28
    Author     : pupil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100 ">
    <h2 class="w-100 d-flex justify-content-center my-5">Редактировать автора</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <div class="" style="max-width: 30rem;min-width: 30rem">
            <form action="editAuthor" method="POST">
                <div class="mb-3">
                    <label for="authorId" class="form-label">Список авторов</label>
                    <select name="authorId"  id="authorId" class="form-select" aria-label="">
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.id}">
                                ${author.firstname}
                            ${author.lastname}. ${author.birthYear}.
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" name="Редактировать" class="btn btn-success mb-3">            
            </form>
        </div>
    </div>
</div>
