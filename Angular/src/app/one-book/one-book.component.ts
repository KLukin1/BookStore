import { Component, Input, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { ActivatedRoute } from '@angular/router';
import { BasketService } from '../services/basket-service';
import { NotifierService } from 'angular-notifier';

@Component({
    selector: 'one-book',
    templateUrl: 'one-book.component.html',
    styleUrls: ['one-book.component.less']
})
export class OneBookComponent implements OnInit {

    book: Book = new Book();
    bookId: number;
    count: number = 1;

    constructor(private bookService: BookService, private route: ActivatedRoute,
        private basketService: BasketService, private notifier: NotifierService) { }

    ngOnInit() {
        this.bookId = +this.route.snapshot.paramMap.get('id');
        this.getBookById(this.bookId);
    }

    getBookById(id: number) {
        this.bookService.getBookById(this.bookId).subscribe(
            result => {
                this.book = result;
            }
        )
    }

    addToBasket(id: number, count: number) {
        this.basketService.addBookToDB(id, count).subscribe(
            result => {
                this.notifier.notify('success', 'Book was added to your basket');
            }, () => {
                this.notifier.notify('error', 'Error!');
            }
        )
    }

    changeCount(c: boolean) {
        if (c == true) {
            this.count += 1;
        } else if (c == false && this.count == 1) {
            this.count = 1;
        } else {
            this.count -= 1;
        }
    }
}

