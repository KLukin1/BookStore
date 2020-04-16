namespace DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BasketItem")]
    public partial class BasketItem
    {
        public int Id { get; set; }

        public int BasketId { get; set; }

        public int BookId { get; set; }

        public int Count { get; set; }
    }
}
