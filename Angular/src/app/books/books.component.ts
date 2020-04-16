import { Component, OnInit } from '@angular/core';
import { BookService } from '../services/book-service';
import { Book } from '../models/book-model';
import { ActivatedRoute, Router, NavigationEnd } from '@angular/router';

@Component({
    selector: 'books',
    templateUrl: 'books.component.html',
    styleUrls: ['books.component.less']
})
export class BooksComponent implements OnInit {

    books: Book[] = [];
    categoryName: string;
    author: string;
    buttonText: string = 'Sort By  <span class="caret"></span>';

    constructor(private bookService: BookService, private route: ActivatedRoute, private router: Router) {
        this.router.events.subscribe(x => {
            if (x instanceof NavigationEnd) {
                this.loadBooks();
            }
        });
    }

    ngOnInit() {
        this.loadBooks();
    }

    loadBooks() {
        this.categoryName = this.route.snapshot.paramMap.get('categoryName');
        this.author = this.route.snapshot.paramMap.get('author');
        this.getBooks(this.categoryName, this.author);
    }

    getBooks(categoryName: string, author: string) {
        this.bookService.getBooks(categoryName, author).subscribe(
            result => {
                this.books = result;
            }
        )
    }

    sortAZ() {
        this.books.sort(function (title1, title2) {
            var textA = title1.Title.toUpperCase();
            var textB = title2.Title.toUpperCase();
            return (textA < textB) ? -1 : (textB < textA) ? 1 : 0;
        })
        this.buttonText = 'Title: A-Z';
    }

    sortZA() {
        this.books.sort(function (title1, title2) {
            var textA = title1.Title.toUpperCase();
            var textB = title2.Title.toUpperCase();
            return (textA < textB) ? 1 : (textB < textA) ? -1 : 0;
        })
        this.buttonText = 'Title: Z-A';
    }

    sortLowHigh() {
        this.books.sort(function (price1, price2) {
            var p1 = price1.Price;
            var p2 = price2.Price;
            if (price1.Discount) {
                p1 = price1.Discount;
            }
            if (price2.Discount) {
                p2 = price2.Discount;
            }
            return (p1 < p2) ? -1 : (p2 < p1) ? 1 : 0;
        })
        this.buttonText = 'Price: L-H';
    }

    sortHighLow() {
        this.books.sort(function (price1, price2) {
            var p1 = price1.Price;
            var p2 = price2.Price;
            if (price1.Discount) {
                p1 = price1.Discount;
            }
            if (price2.Discount) {
                p2 = price2.Discount;
            }
            return (p1 < p2) ? 1 : (p2 < p1) ? -1 : 0;
        })
        this.buttonText = 'Price: H-L';
    }

    addToBasket() {

    }

}
