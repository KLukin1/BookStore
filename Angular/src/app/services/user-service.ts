import { Injectable } from '@angular/core';
import { map, catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CreatedUser } from '../models/created-user-model';

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private httpClient: HttpClient) { }

    createUser(user: CreatedUser): Observable<CreatedUser> {
        return this.httpClient.post('http://localhost:50000/api/users/', user)
            .pipe(map(response => <CreatedUser>response));
    }
}
