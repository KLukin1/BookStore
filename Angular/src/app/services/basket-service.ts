import { Injectable } from '@angular/core';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
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

    deleteFromBasket(basketItemId: number): Observable<boolean> {
        return this.httpClient.delete('http://localhost:50000/api/basket/' + basketItemId)
            .pipe(map(response => <boolean>response));
    }

    changeCount(book: BasketItem): Observable<BasketItem> {
        return this.httpClient.put('http://localhost:50000/api/basket/basketItem', book)
            .pipe(map(response => <BasketItem>response));
    }

    //nije realizirano

    private basketNum = new BehaviorSubject<number>(0);

    getBasketNum(): Observable<number> {
        return this.basketNum.asObservable();
    }

    passBasketNum(basketNum: number) {
        this.basketNum.next(basketNum);
    }
}
