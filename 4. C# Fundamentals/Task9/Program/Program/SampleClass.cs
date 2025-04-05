using System;

public class MathTasks
{
    [Runnable]
    public void Add()
    {
        Console.WriteLine("2 + 3 = " + (2 + 3));
    }

    public void Subtract()
    {
        Console.WriteLine("This won't run because it has no attribute.");
    }
}

public class GreetingTasks
{
    [Runnable]
    public void SayHello()
    {
        Console.WriteLine("Hello from GreetingTasks!");
    }

    [Runnable]
    public void SayBye()
    {
        Console.WriteLine("Goodbye from GreetingTasks!");
    }
}
