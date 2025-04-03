using System;
using System.IO;

class FileIOExample
{
    static void Main()
    {
        string inputFile = "input.txt";  // Input file name
        string outputFile = "output.txt"; // Output file name

        try
        {
            // Check if input file exists
            if (!File.Exists(inputFile))
            {
                Console.WriteLine($"Error: The file '{inputFile}' does not exist.");
                return;
            }

            // Read all lines from the file
            string[] lines = File.ReadAllLines(inputFile);
            int lineCount = lines.Length;

            // Count words in the file
            int wordCount = 0;
            foreach (string line in lines)
            {
                // Splits each line into words using spaces/tabs and counts them.
                wordCount += line.Split(new char[] { ' ', '\t' }, StringSplitOptions.RemoveEmptyEntries).Length;
            }

            // Display results
            Console.WriteLine($"Total Lines: {lineCount}");
            Console.WriteLine($"Total Words: {wordCount}");

            // Write results to output file
            File.WriteAllText(outputFile, $"Total Lines: {lineCount}\nTotal Words: {wordCount}");

            Console.WriteLine($"Results saved in '{outputFile}'.");
        }
        catch (FileNotFoundException)
        {
            Console.WriteLine($"Error: File '{inputFile}' not found.");
        }
        catch (IOException ex)
        {
            Console.WriteLine($"I/O Error: {ex.Message}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Unexpected Error: {ex.Message}");
        }
    }
}
