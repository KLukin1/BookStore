namespace DataBase
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Category")]
    public partial class Category
    {

        public int Id { get; set; }

        [Required]
        public string CategoryName { get; set; }

    }
}
