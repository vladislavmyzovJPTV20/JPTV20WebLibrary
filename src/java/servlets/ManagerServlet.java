/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entity.Author;
import entity.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import session.AuthorFacade;
import session.BookFacade;

/**
 *
 * @author Melnikov
 */
@WebServlet(name = "ManagerServlet", urlPatterns = {
    "/index",
    "/listBooks",
    "/addBook", 
    "/createBook",
    "/editListBooks",
    "/editBook",
    "/updateBook",
    "/addAuthor",
    "/createAuthor"
})
public class ManagerServlet extends HttpServlet {
    @EJB private AuthorFacade authorFacade;
    @EJB private BookFacade bookFacade;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        switch (path) {
            case "/index":
                request.getRequestDispatcher("/listBooks").forward(request, response);
                break;
            case "/listBooks":
                request.setAttribute("info", "Показываем форму");
                List<Book> books = bookFacade.findAll();
                request.setAttribute("books", books);
                request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
                break;
            case "/addBook":
                request.setAttribute("info", "Показываем форму");
                List<Author> authors = authorFacade.findAll();
                request.setAttribute("authors", authors);
                request.setAttribute("activeAddBook", true);
                request.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(request, response);
                break;
            case "/createBook":
                String bookName = request.getParameter("bookName");
                String publishedYear = request.getParameter("publishedYear");
                String quantity = request.getParameter("quantity");
                String[] bookAuthorsArray = request.getParameterValues("authors");
                List<Author> bookAuthors = new ArrayList<>();
                for (int i = 0; i < bookAuthorsArray.length; i++) {
                    bookAuthors.add(authorFacade.find(Long.parseLong(bookAuthorsArray[i])));
                }
                Book newBook = new Book();
                newBook.setBookName(bookName);
                newBook.setAuthor(bookAuthors);
                newBook.setPublishedYear(Integer.parseInt(publishedYear));
                newBook.setQuantity(Integer.parseInt(quantity));
                newBook.setCount(newBook.getQuantity());
                try {
                    bookFacade.create(newBook);
                    request.setAttribute("info", "Успешно добавили книгу в базу");
                } catch (Exception e) {
                    request.setAttribute("info", "Добавить книгу не удалось");
                }
                request.getRequestDispatcher("/addBook").forward(request, response);
                break;
            case "/editListBooks":
                request.setAttribute("activeEditListBooks", true);
                List<Book>listBooks = bookFacade.findAll();
                request.setAttribute("books", listBooks);
                request.getRequestDispatcher("/WEB-INF/editListBooks.jsp").forward(request, response);
                break;
            case "/editBook":
                request.setAttribute("activeEditListBooks", true);
                String bookId = request.getParameter("bookId");
                Book book = bookFacade.find(Long.parseLong(bookId));
                request.setAttribute("book", book);
                request.getRequestDispatcher("/WEB-INF/editBook.jsp").forward(request, response);
                break;
            case "/updateBook":
                bookId = request.getParameter("bookId");
                bookName = request.getParameter("bookName");
                authors = new ArrayList<>();
                String[] newBookAuthorsArray = request.getParameterValues("authors");
                for (int i = 0; i < newBookAuthorsArray.length; i++) {
                    authors.add(authorFacade.find(Long.parseLong(newBookAuthorsArray[i])));
                }
                publishedYear = request.getParameter("publishedYear");
                quantity = request.getParameter("quantity");
                Book updateBook = bookFacade.find(Long.parseLong(bookId));
                updateBook.setBookName(bookName);
                updateBook.setQuantity(Integer.parseInt(quantity));
                updateBook.setPublishedYear(Integer.parseInt(publishedYear));
                updateBook.setAuthor(authors);
                bookFacade.edit(updateBook);
                request.setAttribute("info", "Книга изменена");
                request.getRequestDispatcher("/editListBooks").forward(request, response);
                break;
            case "/addAuthor":
                request.setAttribute("activeAddAuthor", true);
                request.getRequestDispatcher("/WEB-INF/addAuthor.jsp").forward(request, response);
                break;
            case "/createAuthor":
                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String birthYear = request.getParameter("birthYear");
                Author author = new Author();
                author.setBirthYear(Integer.parseInt(birthYear));
                author.setFirstname(firstname);
                author.setLastname(lastname);
                authorFacade.create(author);
                request.setAttribute("info", "Автор успешно добавлен");
                request.getRequestDispatcher("/addAuthor").forward(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
