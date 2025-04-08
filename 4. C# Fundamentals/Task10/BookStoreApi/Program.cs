// Sets up and starts the web app

using BookStoreApi.Data;
using BookStoreApi.Repositories;
using Microsoft.EntityFrameworkCore;

// This sets up the web app builder, which is used to configure: Services (like database, controllers), Middleware (like Swagger or routing)
var builder = WebApplication.CreateBuilder(args);

// Add services

// registering the AppDbContext and telling it to use an in-memory database named BooksDb. hence data will not persist after the app is closed
builder.Services.AddDbContext<AppDbContext>(opt => opt.UseInMemoryDatabase("BooksDb"));

// AddScoped means a new instance will be created for each HTTP request
// Whenever someone asks for IBookRepository, give them an instance of BookRepository
builder.Services.AddScoped<IBookRepository, BookRepository>();

// adds support for API BooksController
builder.Services.AddControllers();

// AddEndpointsApiExplorer() helps Swagger discover endpoints.
builder.Services.AddEndpointsApiExplorer();

// AddSwaggerGen() generates Swagger UI to test APIs interactively.
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Middleware
if (app.Environment.IsDevelopment())
{
    // Enables Swagger middleware
    app.UseSwagger();

    // Adds a nice web-based Swagger UI at /swagger
    app.UseSwaggerUI();
}

// Adds middleware to handle authorization.
app.UseAuthorization();

// Use all controllers with routing like api/books, api/books/{id} etc
app.MapControllers();

// Starts the web application — begins listening for HTTP requests.
app.Run();
