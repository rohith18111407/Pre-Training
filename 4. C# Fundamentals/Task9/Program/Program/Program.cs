using System;
using System.Linq;
using System.Reflection;

class Program
{
    static void Main()
    {
        Console.WriteLine("Scanning for [Runnable] methods...\n");

        // Assembly.GetExecutingAssembly() - Gets the current compiled program.
        // Get all types in the current assembly
        var types = Assembly.GetExecutingAssembly().GetTypes();

        foreach (var type in types)
        {
            // GetMethods(...) - Returns all public instance methods of a type.
            var methods = type.GetMethods(BindingFlags.Public | BindingFlags.Instance);

            foreach (var method in methods)
            {
                // Check if method has [Runnable] attribute
                var isRunnable = method.GetCustomAttribute(typeof(RunnableAttribute)) != null;

                if (isRunnable)
                {
                    Console.WriteLine($"Found: {type.Name}.{method.Name}");

                    // Dynamically creates an object of a class.
                    var instance = Activator.CreateInstance(type);

                    // Dynamically calls the method found.
                    method.Invoke(instance, null);
                    Console.WriteLine(); // new line
                }
            }
        }

        Console.WriteLine("All runnable methods executed.");
    }
}


// Activator is a class in the System namespace that allows you to create instances of types (objects) dynamically at runtime.
// Assembly is a compiled code library (like .exe or .dll) that contains your application code. Includes: All classes, interfaces, structs, and methods and also Metadata (info about types, attributes, references, etc).
// An attribute is metadata that you attach to code elements like classes, methods, or properties to describe their behavior.
// C# has built-in attributes like [Obsolete], [Serializable], etc. 