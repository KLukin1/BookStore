export class BasketItem {
    BookId: number;
    Title: string;
    Image: string;
    AuthorFirstName: string;
    AuthorLastName: string;
    Price: number;
    Discount: number;
    BasketId: number;
    BasketItemId: number;
    Count: number;
    DatePayed: Date;
}

export class HistoryItem {
    BasketId: number;
    DatePayed: Date;
    Items: BasketItem[];
    TotalSum: number;
}
