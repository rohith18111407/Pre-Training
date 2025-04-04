public class Product : IEntity
{
    public int Id { get; set; } // required by IEntity
    public string Name { get; set; }
    public double Price { get; set; }

    public override string ToString()
    {
        return $"ID: {Id}, Name: {Name}, Price: Rs.{Price}";
    }
}
