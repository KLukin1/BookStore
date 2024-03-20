namespace DataBase
{
    using System;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Basket")]
    public partial class Basket
    {

        public int Id { get; set; }

        public int UserId { get; set; }

        public bool? IsPayed { get; set; }

        public DateTime? DatePayed { get; set; }
    }
}
