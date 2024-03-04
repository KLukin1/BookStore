using System;
using System.Collections.Generic;
using System.Linq;

namespace API.Models
{
    public class BasketGetApiModel : BaseBookModel
    {
        public int BasketId { get; set; }
        public int BasketItemId { get; set; }
        public int Count { get; set; }
        public DateTime DatePayed { get; set; }

    }

    public class HistoryGetApiModel
    {
        public int BasketId { get; set; }
        public DateTime DatePayed
        {
            get
            {
                return this.Items.FirstOrDefault().DatePayed;
            }
        }
        public List<BasketGetApiModel> Items { get; set; }
        public decimal TotalSum
        {
            get
            {
                return (decimal)this.Items.Sum(s =>
                {
                    if (s.Discount > 0) return s.Discount * s.Count;
                    else return s.Price * s.Count;
                });
            }
        }
    }
}