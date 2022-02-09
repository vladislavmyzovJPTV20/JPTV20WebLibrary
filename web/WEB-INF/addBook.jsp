<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="w-100 ">
    <h2 class="w-100 d-flex justify-content-center my-5">Добавить книгу</h2>
    <p class="w-100 d-flex justify-content-center text-info">${info}</p>
    <div class="w-100 d-flex justify-content-center">
        <div class="" style="max-width: 30rem;min-width: 30rem"
            <form action="createBook" method="POST">
                <div class="mb-3">
                    <label for="bookName" class="form-label">Название книги</label>
                    <input type="text" class="form-control" name="bookName" id="bookName" aria-describedby="">
                    <div id="bookName" hidden class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="authors" class="form-label">Авторы</label>
                    <select name="authors"  id="authors" multiple class="form-select" aria-label="Default select example">
                        <c:forEach var="author" items="${authors}">
                            <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="publishedYear" class="form-label">Год издания</label>
                    <input type="text" class="form-control" name="publishedYear" id="publishedYear" aria-describedby="">
                    <div id="publishedYear" hidden class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Количество экземпляров</label>
                    <input type="text" class="form-control" name="quantity" id="quantity" aria-describedby="">
                    <div id="quantity" hidden class="form-text">We'll never share your email with anyone else.</div>
                </div>

                <input type="submit" name="Добавить" class="btn btn-success mb-3">
            </form>
        </div>
    </div>
</div>
    