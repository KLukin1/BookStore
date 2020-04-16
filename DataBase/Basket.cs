namespace DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Basket")]
    public partial class Basket
    {
        
        public int Id { get; set; }

        public int UserId { get; set; }

        public bool? IsPayed { get; set; }

        public DateTime? DatePayed { get; set; }
    }
}
