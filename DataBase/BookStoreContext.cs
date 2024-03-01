namespace DataBase
{
    using System.Data.Entity;

    public partial class BookStoreContext : DbContext
    {
        public BookStoreContext()
            : base("name=BookShopEntities")
        {
        }

        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Basket> Baskets { get; set; }
        public virtual DbSet<BasketItem> BasketItems { get; set; }
        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<User> Users { get; set; }

    }
}
