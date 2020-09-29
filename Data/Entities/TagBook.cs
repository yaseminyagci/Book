using Core.BaseModels;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Data.Entities
{
    public class TagBook : HelperModel, IEntity
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("Tag")]
        public int TagId { get; set; }
        [ForeignKey("Book")]
        public int BookId { get; set; }
 
        public Book Book { get; set; }

        public Tag Tag { get; set; }
        public byte Selected { get; set; }
    }
}
