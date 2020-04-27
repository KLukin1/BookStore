import { Injectable } from '@angular/core';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable, Subject } from 'rxjs';
import { BasketItem } from '../models/basket-model';

@Injectable({
    providedIn: 'root'
})
export class BasketService {

    constructor(private httpClient: HttpClient) { }

    addBookToDB(id: number, count: number): Observable<number> {
        return this.httpClient.post('http://localhost:50000/api/basket', { BookId: id, Count: count })
            .pipe(map(response => <number>response));
    }

    getBasket(): Observable<BasketItem[]> {
        return this.httpClient.get('http://localhost:50000/api/basket')
            .pipe(map(response => <BasketItem[]>response));
    }

    changeCount(book: BasketItem): Observable<BasketItem> {
        return this.httpClient.put('http://localhost:50000/api/basket/basketItem', book)
            .pipe(map(response => <BasketItem>response));
    }


    getBasketCountApi(): Observable<number> {
        return this.httpClient.get('http://localhost:50000/api/basket/count')
            .pipe(map(response => <number>response));
    }

    private subject = new Subject<any>();

    sendBasketNum() {
        this.subject.next();
    }

    getBasketNum(): Observable<any> {
        return this.subject.asObservable();
    }
}
