import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { isNullOrUndefined } from 'util';

@Component({
    selector: 'search',
    templateUrl: 'search.component.html',
    styleUrls: ['search.component.less']
})
export class SearchComponent implements OnInit {

    books: Book[] = [];
    inputValue: string = "";
    searchedBooks: Book[] = [];

    constructor(private bookService: BookService) { }

    ngOnInit() {
        this.getAllTitles();
    }

    getAllTitles() {
        this.bookService.getBooks("", "").subscribe(
            result => {
                this.books = result;
            })
    }

    search(input) {
        this.inputValue = input.value;
        if (!this.inputValue) {
            this.searchedBooks = [];
        } else {
            this.searchedBooks = [];

            var oneInput = this.inputValue.toLowerCase().split(" ");
            for (let i = 0; i < this.books.length; i++) {
                var oneBook = this.books[i].Title.toLowerCase();
                var counter = 0;
            
                for (let j = 0; j < oneInput.length; j++) {
                    if (oneBook.includes(oneInput[j])) {
                        counter += 1;
                    }
                }
                if (counter == oneInput.length) {
                    this.searchedBooks.push(this.books[i]);
                }
            }
        }
    }
}
