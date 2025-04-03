using System;

class Program
{
    static void Main()
    {
        Console.Write("Enter a positive integer: ");
        string input = Console.ReadLine(); // Read user input
        if (int.TryParse(input, out int number) && number >= 0)
        {
            long factorial = CalculateFactorial(number);
            Console.WriteLine($"Factorial of {number} is: {factorial}");
        }
        else
        {
            Console.WriteLine("Invalid input! Please enter a positive integer.");
        }
    }

    static long CalculateFactorial(int n)
    {
        long factorial = 1;
        for (int i = 1; i <= n; i++)
        {
            factorial *= i;
        }
        return factorial;
    }
}
