import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';

@Component({
    selector: 'home',
    templateUrl: 'home.component.html',
    styleUrls: ['home.component.less']
})
export class HomeComponent implements OnInit {

    reccomendedBooks: Book[] = [];
    slides: any = [[]];

    constructor(private bookService: BookService) { }

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
}
