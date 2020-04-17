import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Book } from '../models/book-model';
import { map, catchError } from 'rxjs/operators';


@Injectable({
    providedIn: 'root'
})
export class BookService {

    bookId: number;

    constructor(private httpClient: HttpClient) { }

    getBooks(categoryName: string, author: string): Observable<Book[]> {
        let url: string = 'http://localhost:50000/api/books/';
        if (categoryName) {
            url += "?categoryName=" + categoryName;
            if (author) {
                url += "&author=" + author;
            }
        } else {
            if (author) {
                url += "?author=" + author;
            }
        }
        return this.httpClient.get(url)
            .pipe(map(response => <Book[]>response));
    }

    getBookById(id: number): Observable<Book> {
        return this.httpClient.get('http://localhost:50000/api/books/' + id)
            .pipe(map(response => <Book>response))
    }

    getReccomended(): Observable<Book[]> {
        return this.httpClient.get('http://localhost:50000/api/books/reccomended')
            .pipe(map(response => <Book[]>response))
    }

}
