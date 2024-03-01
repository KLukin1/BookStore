namespace DataBase
{
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("BasketItem")]
    public partial class BasketItem
    {
        public int Id { get; set; }

        public int BasketId { get; set; }

        public int BookId { get; set; }

        public int Count { get; set; }
    }
}
