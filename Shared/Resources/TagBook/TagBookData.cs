using System;
using System.Collections.Generic;
using System.Text;

namespace Shared.Resources.TagBook
{
    public class TagBookData
    {
        public int Id { get; set; }
        public int TagId { get; set; }
        public int BookId { get; set; }
        public byte Selected { get; set; }

    }
}
