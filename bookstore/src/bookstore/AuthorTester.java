package bookstore;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class AuthorTester {

    public static void main(String[] args) {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authorJpa");
        EntityManager em = emf.createEntityManager();

//        Author author = em.find(Author.class, 1);
//        System.out.println("Author: " + author.getName());

        //display list of authors
        Query query = em.createQuery("SELECT a FROM Author a");
        List<Author> authors = query.getResultList();

        for (Author author : authors) {
            System.out.println("Author: " + author.getName());
        }
        
        //display query list of books
        Query bookQuery = em.createQuery("SELECT b FROM Book b");
        List<Book> books = bookQuery.getResultList();

        for (Book book : books) {
            System.out.println("Book: " + book.getTitle() + " has Author: " + book.getAuthor().getName());
        }
        
        //display query list by Author and the Books by the author
        Query query1 = em.createQuery("SELECT a FROM Author a");
        List<Author> authors1 = query1.getResultList();

        for (Author author : authors1) {
            System.out.println("Author: " + author.getName());

            for (Book book : author.getBooks()) {
                System.out.println("\tBook: " + book.getTitle());
            }
        }

        //add to new book database to the first author "1"
        em.getTransaction().begin();

        Book newBook = new Book();
        newBook.setTitle("The Mysterious Stranger");

        Author firstAuthor = em.find(Author.class, 1);
        newBook.setAuthor(firstAuthor);

        em.persist(newBook);

        em.getTransaction().commit();

        em.close();
    }
}
