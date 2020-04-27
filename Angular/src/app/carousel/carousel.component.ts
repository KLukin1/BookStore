import { Component } from '@angular/core';
import { Book } from '../models/book-model';
import { BookService } from '../services/book-service';
import { BasketService } from '../services/basket-service';
import { NotifierService } from 'angular-notifier';

@Component({
    selector: 'carousel',
    templateUrl: 'carousel.component.html',
    styleUrls: ['carousel.component.less']
})
export class CarouselComponent {

    reccomendedBooks: Book[] = [];
    slides = [[]];

    constructor(private bookService: BookService, private basketService: BasketService,
        private notifier: NotifierService) { }

    ngOnInit() {
        this.getReccomended();
    }

    getReccomended() {
        this.bookService.getReccomended().subscribe(
            result => {
                this.reccomendedBooks = result;
                this.slides = this.makeSlides(this.reccomendedBooks, 3);
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

    addToBasket(id: number, count: number) {
        this.basketService.addBookToDB(id, count).subscribe(
            result => {
                this.notifier.notify('success', 'Book was added to your basket');
                this.sendBasketNum();
            }
        )
    }

    sendBasketNum() {
        this.basketService.sendBasketNum();
    }
}
