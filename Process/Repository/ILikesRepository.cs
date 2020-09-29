using Data.Entities;
using Shared.Resources.Likes;
using System.Collections.Generic;

namespace Process.Repository
{
    public interface ILikesRepository: IRepository<Likes>
    {
        List<LikeChart> GetLikesByTag();
    }
}