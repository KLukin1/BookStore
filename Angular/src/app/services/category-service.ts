import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map, catchError } from 'rxjs/operators';
import { Category } from '../models/category-model';


@Injectable({
    providedIn: 'root'
})
export class CategoryService {

    constructor(private httpClient: HttpClient) { }

    getCategories(): Observable<Category[]> {
        return this.httpClient.get('http://localhost:50000/api/category')
            .pipe(map(response => <Category[]>response));
    }

}
