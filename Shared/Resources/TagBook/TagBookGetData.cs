using Shared.Resources.Book;
using Shared.Resources.Tag;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shared.Resources.TagBook
{
    public class TagBookGetData
    {
        public int Id { get; set; }     
        public BookGetData Book { get; set; }
        public TagGetData Tag { get; set; }
        public bool Selected { get; set; }

    }
}
