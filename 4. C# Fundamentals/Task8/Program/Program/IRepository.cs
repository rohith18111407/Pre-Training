using System.Collections.Generic;

public interface IRepository<T> where T : class, IEntity
{
    void Add(T entity);
    T Get(int id);
    // IEnumerable<T> -returning collections when you just want to loop through items
    IEnumerable<T> GetAll();
    void Update(int id, T entity);
    void Delete(int id);
}

//  Generic Repository (IRepository<T>) provides a reusable data access layer