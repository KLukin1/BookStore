namespace DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Book")]
    public partial class Book
    {

        public int Id { get; set; }

        public int CategoryId { get; set; }

        public int AuthorId { get; set; }

        [Required]
        [StringLength(50)]
        public string Title { get; set; }

        public int? Year { get; set; }

        [StringLength(13)]
        public string ISBN { get; set; }

        public string Summary { get; set; }

        public decimal Price { get; set; }

        public decimal? Discount { get; set; }

        public string Image { get; set; }
    }
}
