// 	Connects to the database

using Microsoft.EntityFrameworkCore;
using BookStoreApi.Models; // includes Book class.

namespace BookStoreApi.Data
{
    public class AppDbContext : DbContext  // inherits from DbContext
    {
        // DbContextOptions<AppDbContext> - provides DB configuration like in-memory or SQL
        // It receives an options object (with connection info and config) and passes it to the base DbContext class.
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        // DbSet<Book> means EF Core should create and manage a table for Book entities. Books is the name of the table.
        // Set<Book>() returns the internal set EF uses for queries and changes.
        // When someone accesses the Books property, return the result of Set<Book>()
        public DbSet<Book> Books => Set<Book>();
    }
}
