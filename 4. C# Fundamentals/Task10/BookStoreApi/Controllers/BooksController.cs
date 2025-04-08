// 	Exposes HTTP endpoints

using Microsoft.AspNetCore.Mvc;
using BookStoreApi.Models;
using BookStoreApi.Repositories;

namespace BookStoreApi.Controllers
{
    [ApiController]
    // [Route("api/[controller]")] means this controller handles requests like:GET /api/books, POST /api/books, etc.
    [Route("api/[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly IBookRepository _repo;

        // dependency injection - ASP.NET Core will automatically provide an instance of `IBookRepository` when it creates the controller.
        public BooksController(IBookRepository repo)
        {
            _repo = repo;
        }

        // ActionResult<T> - returning data and HTTP responses and acts as a return type for controller actions.
        // Calls the repository to get all books.
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Book>>> GetAll() =>
            Ok(await _repo.GetAllAsync());

        // If found, returns 200 OK. If not, returns 404 Not Found.
        // GET /api/books/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Book>> GetById(int id)
        {
            var book = await _repo.GetByIdAsync(id);
            if (book == null) return NotFound();
            return Ok(book);
        }

        // Returns 201 Created with the location of the new book using CreatedAtAction().
        // POST /api/books
        [HttpPost]
        public async Task<ActionResult<Book>> Create(Book book)
        {
            var created = await _repo.AddAsync(book);
            return CreatedAtAction(nameof(GetById), new { id = created.Id }, created);
        }

        // If not found, 404 Not Found. If successful, 200 OK with the updated book.
        // PUT /api/books/{id}
        [HttpPut("{id}")]
        public async Task<ActionResult<Book>> Update(int id, Book book)
        {
            var updated = await _repo.UpdateAsync(id, book);
            if (updated == null) return NotFound();
            return Ok(updated);
        }

        // If not found, 404 Not Found. If deleted, 204 No Content (success but no body).
        // DELETE /api/books/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var deleted = await _repo.DeleteAsync(id);
            if (!deleted) return NotFound();
            return NoContent();
        }
    }
}

// Swagger is used bcoz it shows tehse as a UI where you can test each route interactively
