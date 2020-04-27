import { Injectable } from '@angular/core';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
    providedIn: 'root'
})
export class SearchService {

    constructor(private httpClient: HttpClient) {}

    getAllTitles(): Observable<any> {
        return this.httpClient.get('http://localhost:50000/api/books')
            .pipe(map(response => <any>response));
    }

}
