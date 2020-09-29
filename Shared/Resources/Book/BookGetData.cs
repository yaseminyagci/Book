using Core.Constants;
using Shared.Resources.User;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Shared.Resources.Book
{
   public class BookGetData
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Publish { get; set; }
        public string Language { get; set; }
        public string Content { get; set; }      
        public string Img { get; set; }
        public UserDetailGetData User { get; set; }
        public DateTime DateCreated { get; set; }

    }
}
