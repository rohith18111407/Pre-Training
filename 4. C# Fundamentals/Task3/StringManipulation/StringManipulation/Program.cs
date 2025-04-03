using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        List<string> tasks = new List<string>();  // List to store tasks
        while (true)
        {
            Console.WriteLine("\nTask Manager");
            Console.WriteLine("1. Add Task");
            Console.WriteLine("2. Remove Task");
            Console.WriteLine("3. Display Tasks");
            Console.WriteLine("4. Exit");
            Console.Write("Choose an option: ");

            string choice = Console.ReadLine().Trim();  // Trim whitespace

            switch (choice)
            {
                case "1":
                    Console.Write("Enter a task: ");
                    string task = Console.ReadLine().Trim();  // Remove leading/trailing spaces
                    if (!string.IsNullOrEmpty(task))
                    {
                        tasks.Add(task); // add task to the list of tasks creasted
                        Console.WriteLine($"Task '{task.ToUpper()}' added.");
                    }
                    else
                    {
                        Console.WriteLine("Task cannot be empty.");
                    }
                    break;

                case "2":
                    if (tasks.Count == 0)
                    {
                        Console.WriteLine("No tasks to remove.");
                    }
                    else
                    {
                        Console.Write("Enter task to remove: ");
                        string removeTask = Console.ReadLine().Trim().ToLower(); // Convert to lowercase

                        // COnverts the tasks to lowercase to find and remove the selected tsk
                        string taskToRemove = tasks.Find(t => t.ToLower() == removeTask);

                        if (taskToRemove != null)
                        {
                            tasks.Remove(taskToRemove);
                            Console.WriteLine($"Task '{taskToRemove.ToUpper()}' removed.");
                        }
                        else
                        {
                            Console.WriteLine("Task not found.");
                        }

                    }
                    break;

                case "3":
                    if (tasks.Count == 0)
                    {
                        Console.WriteLine("No tasks available.");
                    }
                    else
                    {
                        Console.WriteLine("\nYour Tasks:");
                        foreach (var t in tasks)
                        {
                            Console.WriteLine($"- {t.ToUpper()}");  // Display tasks in uppercase
                        }
                    }
                    break;

                case "4":
                    Console.WriteLine("Exiting program...");
                    return;

                default:
                    Console.WriteLine("Invalid choice. Please enter 1, 2, 3, or 4.");
                    break;
            }
        }
    }
}
