using System;
using System.Collections.Generic;

public class InMemoryRepository<T> : IRepository<T> where T : class, IEntity
    // where T : class, IEntity: Ensures T implements IEntity
{
    // _data: Stores entities in a dictionary (key: Id, value: entity)
    // readonly-The reference to the dictionary cannot be changed after initialization (but the contents can still be modified).
    private readonly Dictionary<int, T> _data = new();
    private int _nextId = 1; // Auto-incrementing ID

    public void Add(T entity)
    {
        entity.Id = _nextId++; // Assign unique ID
        _data[entity.Id] = entity;
    }

    public T Get(int id)
    {
        //  retrieve a value from the dictionary. It returns true if the key exists, and false if it doesn't.
        // out var entity - If found, assigns the corresponding value (the entity of type T) to entity.
        _data.TryGetValue(id, out var entity);
        return entity;
    }

    public IEnumerable<T> GetAll()
    {
        return _data.Values;
    }

    public void Update(int id, T entity)
    {
        if (_data.ContainsKey(id))
        {
            entity.Id = id; // Preserve the ID
            _data[id] = entity;
        }
        else
        {
            Console.WriteLine($"Entity with ID {id} not found.");
        }
    }

    public void Delete(int id)
    {
        if (_data.ContainsKey(id))
        {
            _data.Remove(id);
        }
        else
        {
            Console.WriteLine($"Entity with ID {id} not found.");
        }
    }
}

//  InMemoryRepository<T> is a simple implementation using a dictionary
