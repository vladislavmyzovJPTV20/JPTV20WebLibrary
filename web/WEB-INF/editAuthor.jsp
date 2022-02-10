<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100 ">
    <h2 class="w-100 d-flex justify-content-center my-5">Редактировать автора</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <div class="" style="max-width: 30rem;min-width: 30rem">
            <form action="updateAuthor" method="POST">
                <div class="mb-3">
                    <label for="firstname" class="form-label">Имя автора</label>
                    <input type="text" class="form-control" name="firstname" id="firstname" aria-describedby="" value="${author.firstname}">
                    <div id="firstname" hidden class="form-text">error</div>
                    <input type="text" class="form-control" hidden name="authorId" id="authorId" value="${author.id}">
                </div>
                <div class="mb-3">
                    <label for="lastname" class="form-label">Фамилия</label>
                    <input type="text" class="form-control" name="lastname" id="lastname" aria-describedby="" value="${author.lastname}">
                    <div id="lastname" hidden class="form-text">error</div>
                </div>
                <div class="mb-3">
                    <label for="birthYear" class="form-label">Год рождения</label>
                    <input type="text" class="form-control" name="birthYear" id="birthYear" aria-describedby="" value="${author.birthYear}">
                    <div id="birthYear" hidden class="form-text">error</div>
                </div>

                <input type="submit" name="Изменить" class="btn btn-success mb-3">
            </form>
        </div>
    </div>
</div>
