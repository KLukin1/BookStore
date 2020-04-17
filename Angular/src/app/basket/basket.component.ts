import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { BasketService } from '../services/basket-service';

@Component({
    selector: 'basket',
    templateUrl: 'basket.component.html',
    styleUrls: ['basket.component.less']
})
export class BasketComponent implements OnInit {

    books: Book[] = [];
    prices: number[] = [];
    totalPrice: number = 0;

    constructor(private bookService: BookService, private basketService: BasketService) { }

    ngOnInit() {
        this.getBasket();
    }

    getBasket() {
        //this.basketService.getBookId().subscribe(
        //    response => {

        //    }
        //)
        //this.bookService.getBookById(id).subscribe(
        //    result => {
        //        this.books.push(result)

        //        for (let i of this.books) {
        //            this.prices.push(i.Price);
        //        }

        //        for (let price of this.prices) {
        //            this.totalPrice += price;
        //        }
        //    }
        //)
    }

}
