using System;

class Program
{
    static void Main()
    {
        IRepository<Product> productRepo = new InMemoryRepository<Product>();

        // Adding products
        productRepo.Add(new Product { Name = "Laptop", Price = 98000 });
        productRepo.Add(new Product { Name = "Smartphone", Price = 30000 });
        productRepo.Add(new Product { Name = "Headphones", Price = 15000 });

        // Display all products
        Console.WriteLine("Product List:");
        foreach (var product in productRepo.GetAll())
        {
            Console.WriteLine(product);
        }

        // Update a product
        var productToUpdate = productRepo.Get(1);
        if (productToUpdate != null)
        {
            productToUpdate.Price = 110000;
            productRepo.Update(1, productToUpdate);
        }

        // Display updated product
        Console.WriteLine("\nUpdated Product (ID 1):");
        Console.WriteLine(productRepo.Get(1));

        // Delete a product
        productRepo.Delete(2);
        Console.WriteLine("\nDeleted Product ID 2");

        // Display all products again
        Console.WriteLine("\n Remaining Products:");
        foreach (var product in productRepo.GetAll())
        {
            Console.WriteLine(product);
        }
    }
}
