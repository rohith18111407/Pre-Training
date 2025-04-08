// Implements methods for CRud

using Microsoft.EntityFrameworkCore;
using BookStoreApi.Data;
using BookStoreApi.Models;

namespace BookStoreApi.Repositories
{
    public class BookRepository : IBookRepository
    {
        // `readonly` means it can only be set once in the constructor.
        private readonly AppDbContext _context;

        public BookRepository(AppDbContext context)
        {
            _context = context;
        }

        // ToListAsync() fetches the data as a list.
        public async Task<IEnumerable<Book>> GetAllAsync() =>
            await _context.Books.ToListAsync();

        // FindAsync looks it up using the primary key
        public async Task<Book?> GetByIdAsync(int id) =>
            await _context.Books.FindAsync(id);

        // SaveChangesAsync() writes it to the database.
        // Add() stages the book for insertion.
        public async Task<Book> AddAsync(Book book)
        {
            _context.Books.Add(book);
            await _context.SaveChangesAsync();
            return book;
        }

        public async Task<Book?> UpdateAsync(int id, Book updatedBook)
        {
            var existing = await _context.Books.FindAsync(id);
            if (existing == null) return null;

            existing.Title = updatedBook.Title;
            existing.Author = updatedBook.Author;
            existing.Price = updatedBook.Price;

            await _context.SaveChangesAsync();
            return existing;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null) return false;

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
