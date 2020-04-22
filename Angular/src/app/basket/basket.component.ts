import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { BasketService } from '../services/basket-service';
import { BasketItem } from '../models/basket-model';
import { NotifierService } from 'angular-notifier';

@Component({
    selector: 'basket',
    templateUrl: 'basket.component.html',
    styleUrls: ['basket.component.less']
})
export class BasketComponent implements OnInit {

    books: BasketItem[] = [];
    prices: number[];
    totalPrice: number;

    constructor(private bookService: BookService, private basketService: BasketService,
        private notifier: NotifierService) { }

    ngOnInit() {
        this.getBasket();
    }

    getBasket() {
        this.basketService.getBasket().subscribe(
            response => {
                this.books = response;
                this.calculatePrices();
            })
    }

    deleteFromBasket(basketItemId: number) {
        this.basketService.deleteFromBasket(basketItemId).subscribe(
            response => {
                this.books = this.books.filter(x => x.BasketItemId != basketItemId);
                this.calculatePrices();
                this.notifier.notify("success", "Book was removed from the basket");
            })
    }

    calculatePrices() {
        this.prices = [];
        this.totalPrice = 0;

        for (let book of this.books) {
            if (book.Discount) {
                this.prices.push(book.Discount * book.Count);
            } else {
                this.prices.push(book.Price * book.Count);
            }
        }
        for (let price of this.prices) {
            this.totalPrice += price;
        }
    }


    changeCounter(c: boolean, book: BasketItem) {
        if (c == true) {
            book.Count += 1;
            this.calculatePrices();
            this.basketService.changeCount(book).subscribe(
                result => {
                    this.notifier.notify("info", "Basket is updated");
                })
        }
        else {
            if (book.Count == 1) {
                book.Count = 1;
            } else {
                book.Count -= 1;
            }
            this.calculatePrices();
            this.basketService.changeCount(book).subscribe(
                result => {
                    this.notifier.notify("info", "Basket is updated");
                })
        }
    }
}
