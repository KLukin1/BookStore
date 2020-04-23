import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { BasketService } from '../services/basket-service';
import { NotifierService } from 'angular-notifier';

@Component({
    selector: 'home',
    templateUrl: 'home.component.html',
    styleUrls: ['home.component.less']
})
export class HomeComponent implements OnInit {

    reccomendedBooks: Book[] = [];
    slides: any = [[]];
    count1: number = 1;

    constructor(private bookService: BookService, private basketService: BasketService,
        private notifier: NotifierService) { }

    ngOnInit() {
        this.getReccomended();
    }

    getReccomended() {
        this.bookService.getReccomended().subscribe(
            result => {
                this.reccomendedBooks = result;
                this.slides = this.chunk(this.reccomendedBooks, 3);
            })
    }

    chunk(arr, chunkSize) {
        let R = [];
        for (let i = 0, len = arr.length; i < len; i += chunkSize) {
            R.push(arr.slice(i, i + chunkSize));
        }
        return R;
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
