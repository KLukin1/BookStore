import { Injectable } from '@angular/core';
import { map, catchError, retry } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { CreatedUser, UserLogin } from '../models/created-user-model';

@Injectable({
    providedIn: 'root'
})
export class UserService {

    constructor(private httpClient: HttpClient) { }

    createUser(user: CreatedUser): Observable<CreatedUser> {
        return this.httpClient.post('http://localhost:50000/api/users/', user)
            .pipe(map(response => <CreatedUser>response));
    }

    loginGET(): Observable<UserLogin> {
        return this.httpClient.get('http://localhost:50000/api/login')
            .pipe(map(response => <UserLogin>response));
    }

    loginPOST(user: UserLogin): Observable<any> {
        return this.httpClient.post('http://localhost:50000/api/login', user)
            .pipe(map(response => <any>response));
    }
}
