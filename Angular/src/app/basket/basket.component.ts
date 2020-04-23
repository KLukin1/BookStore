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
    basketNum: number;

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
                this.sendBasketNum();
            })
    }

    sendBasketNum() {
        this.basketService.sendBasketNum();
    }

    deleteFromBasket(book: BasketItem) {
        book.Count = 0;
        this.basketService.changeCount(book).subscribe(
            response => {
                this.books = this.books.filter(x => x.BasketItemId != book.BasketItemId);
                this.calculatePrices();
                this.sendBasketNum();
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


    changeCounter(c: number, book: BasketItem) {
        book.Count = c;
        this.calculatePrices();
        this.basketService.changeCount(book).subscribe(
            result => {
                this.notifier.notify("info", "Basket is updated");
                this.basketService.sendBasketNum();
            })
    }
}
