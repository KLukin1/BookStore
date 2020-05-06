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
  site = 'https://klaras-book-store.azurewebsites.net/';

  constructor(private httpClient: HttpClient) { }

  getBooks(categoryName: string, author: string): Observable<Book[]> {
    let url: string = this.site + 'api/books/';
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
    return this.httpClient.get(this.site + 'api/books/' + id)
      .pipe(map(response => <Book>response))
  }

  getReccomended(): Observable<Book[]> {
    return this.httpClient.get(this.site + 'api/books/reccomended')
      .pipe(map(response => <Book[]>response))
  }

}
