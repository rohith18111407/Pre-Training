using System;

class Person
{
    // Properties (Encapsulation)
    // get allows retrieving the val of the property
    // set allows assigning a new value to property
    public string Name { get; set; }
    public int Age { get; set; }

    // Constructor
    public Person(string name, int age)
    {
        Name = name;
        Age = age;
    }

    // Method to introduce the person
    public void Introduce()
    {
        Console.WriteLine($"Hello, my name is {Name} and I am {Age} years old.");
    }
}

class Program
{
    static void Main()
    {
        // Creating Person objects
        Person person1 = new Person("Rohith", 21);
        Person person2 = new Person("Santhosh", 21);
        Person person3 = new Person("Preethi", 25);

        // Calling the Introduce method for each person
        person1.Introduce();
        person2.Introduce();
        person3.Introduce();
    }
}
