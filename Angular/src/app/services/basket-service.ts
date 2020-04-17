import { Injectable } from '@angular/core';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class BasketService {

    constructor(private httpClient: HttpClient) { }

    addBookToDB(id: number): Observable<number> {
        return this.httpClient.post('http://localhost:50000/api/basket', { BookId: id })
            .pipe(map(response => <number>response));
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
