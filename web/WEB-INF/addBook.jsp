<%-- 
    Document   : addBook
    Created on : Jan 31, 2022, 2:09:09 PM
    Author     : Pupil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Добавить книгу</h1>
        <p>${info}</p>
        <form action="createBook" method="POST">
            Название книги: <input type="text" name="bookName"><br>
            Авторы: 
            <select name="authors" multiple>
                <c:forEach var="author" items="${authors}">
                    <option value="${author.id}">${author.firstname} ${author.lastname}</option>
                </c:forEach>
            </select><br>
            Год издания: <input type="text" name="publishedYear"><br>
            Количество экземпляров: <input type="text" name="quantity"><br>
            <input type="submit" name="Добавить">
        </form>
    </body>
</html>
