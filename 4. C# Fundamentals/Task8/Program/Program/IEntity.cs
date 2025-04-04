public interface IEntity
{
    int Id { get; set; }
}

//  IEntity ensures each entity has an Id for repository operations.