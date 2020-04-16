import { Component, Input, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { ActivatedRoute } from '@angular/router';

@Component({
    selector: 'one-book',
    templateUrl: 'one-book.component.html',
    styleUrls: ['one-book.component.less']
})
export class OneBookComponent implements OnInit {

    book: Book = new Book();
    bookId: number;

    constructor(private bookService: BookService, private route: ActivatedRoute) {}

    ngOnInit() {
        this. bookId = +this.route.snapshot.paramMap.get('id');
        this.getBookById(this.bookId);
    }

    getBookById(id: number) {
        this.bookService.getBookById(this.bookId).subscribe(
            result => {
                this.book = result;
            }
        )
    }

    addToBasket() {

    }
}
