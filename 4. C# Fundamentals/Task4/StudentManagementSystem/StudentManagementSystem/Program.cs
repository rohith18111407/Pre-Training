using System;
using System.Collections.Generic;
using System.Linq;

class Student
{
    public string Name { get; set; }
    public int Age { get; set; }
    public double Grade { get; set; }
}

class Program
{
    static void Main()
    {
        // Sample student data
        List<Student> students = new List<Student>
        {
            new Student { Name = "Ricson", Age = 20, Grade = 85.5 },
            new Student { Name = "Ojus", Age = 22, Grade = 72.3 },
            new Student { Name = "Sanjhay", Age = 19, Grade = 90.2 },
            new Student { Name = "Rayhan", Age = 21, Grade = 68.4 },
            new Student { Name = "Rohith", Age = 20, Grade = 95.1 }
        };

        Console.Write("Enter minimum grade threshold: ");
        if (double.TryParse(Console.ReadLine(), out double threshold))
        {
            // Use LINQ to filter students with grades above the threshold
            var filteredStudents = students
                .Where(s => s.Grade >= threshold) // Filter
                .OrderByDescending(s => s.Grade)  // Sort by Grade descending
                .ThenBy(s => s.Name);             // If grades are same, sort by Name ascending

            Console.WriteLine("\nStudents meeting the criteria:");
            foreach (var student in filteredStudents)
            {
                Console.WriteLine($"Name: {student.Name}, Age: {student.Age}, Grade: {student.Grade}");
            }
        }
        else
        {
            Console.WriteLine("Invalid input. Please enter a numeric value.");
        }
    }
}
