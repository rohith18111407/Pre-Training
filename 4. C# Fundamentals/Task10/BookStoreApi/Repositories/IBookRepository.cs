// Defines methods for CRUD

using BookStoreApi.Models;

namespace BookStoreApi.Repositories
{
    public interface IBookRepository
    {
        // Task<> indicates this method is asynchronous
        // IEnumerable<Book> means it's a collection of Book objects.
        Task<IEnumerable<Book>> GetAllAsync();

        //  `?` means the return value can be `null` (nullable)
        // Returns a single book by its `id`, or `null` if not found.
        Task<Book?> GetByIdAsync(int id);

        Task<Book> AddAsync(Book book);

        // Returns the updated book, or `null` if not found.
        Task<Book?> UpdateAsync(int id, Book updatedBook);

        Task<bool> DeleteAsync(int id);
    }
}
