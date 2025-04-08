// 	Represents the data

namespace BookStoreApi.Models
{
    public class Book
    {
        public int Id { get; set; } // Primary key
        public string Title { get; set; }
        public string Author { get; set; }
        public decimal Price { get; set; }
    }
}
