using Data;
using Data.Entities;
using Shared.Resources.Likes;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Process.Repository
{
    public class LikesRepository : Repository<Likes>, ILikesRepository
    {
        private readonly ApplicationDbContext _context;

        public LikesRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public List<LikeChart> GetLikesByTag()
        {
            var query = from l in _context.Likes
                        join p in _context.Books
                        on l.BookId equals p.Id
                        join t in _context.TagBooks
                        on p.Id equals t.BookId
                        join tg in _context.Tags
                        on t.TagId equals tg.Id                      
                        group tg by new { tg.TagName } into g
                        orderby g.Count()
                        select new LikeChart {
                            TagName = g.Key.TagName,
                            Count = g.Count()
                        };
            return query.ToList();
        }
    }
}
