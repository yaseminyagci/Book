using Core.Constants;
using Shared.Resources.TagBook;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Shared.Resources.Book
{
    public class BookData
    {

        public int Id { get; set; }
        [Required]
        [StringLength(GeneralConstants.StringLengthXs)]
        public string Title { get; set; }
        public string Author { get; set; }
        public string Publish { get; set; }
        public string Language { get; set; }
        [Required]
        public string Content { get; set; }
        //[Required]
        [StringLength(GeneralConstants.StringLengthMd)]
        public string Img { get; set; }
        public string UserId { get; set; }
        public int[] Tags { get; set; }

    }
}
