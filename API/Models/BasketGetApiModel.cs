﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class BasketGetApiModel : BaseBookModel
    {
        public int BasketId { get; set; }
        public int BasketItemId { get; set; }
        public int Count { get; set; }

    }
}