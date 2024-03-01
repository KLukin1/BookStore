import { Component } from '@angular/core';
import { Book } from '../models/book-model';
import { BookService } from '../services/book-service';
import { BasketService } from '../services/basket-service';
import { NotifierService } from 'angular-notifier';
import { UserService } from '../services/user-service';
import * as myGlobals from '../global-variables';

@Component({
    selector: 'carousel',
    templateUrl: 'carousel.component.html',
    styleUrls: ['carousel.component.less']
})
export class CarouselComponent {

    recommendedBooks: Book[] = [];
    slides = [[]];
    siteName: string = myGlobals.siteName;

    constructor(private bookService: BookService, private basketService: BasketService,
        private notifier: NotifierService) { }

    ngOnInit() {
        this.getRecommended();
    }

    getRecommended() {
        this.bookService.getRecommended().subscribe(
            result => {
                this.recommendedBooks = result;
                this.slides = this.makeSlides(this.recommendedBooks, 3);
            })
    }

    makeSlides(books, slideSize) {
        var slideBooks = [];
        for (let i = 0; i < books.length; i += slideSize) {
            slideBooks.push(books.slice(i, i + slideSize));
        }
        return slideBooks;
    }

    timer() {

    }

    // todo - fix bug: adding doesn't work if book is already in basket
    addToBasket(id: number, count: number) {
        if (UserService.getCurrentUser()) {
            this.basketService.addBookToDB(id, count).subscribe(
                result => {
                    this.notifier.notify('success', 'Book was added to your basket');
                    this.sendBasketNum();
                }
            )
        } else {
            this.notifier.notify("info", "Please Sign In to add Books to your Basket");
        }
    }

    sendBasketNum() {
        this.basketService.sendBasketNum();
    }
}
