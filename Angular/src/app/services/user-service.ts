import { Injectable } from '@angular/core';
import { map, catchError, retry } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';
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

    userAuthentication(email: string, password: string): Observable<any> {
        var data = "username=" + email + "&password=" + password + "&grant_type=password";
        var reqHeader = new HttpHeaders({ "Content-Type": "application/x-www-urlencoded", "No-Auth": "True" });
        return this.httpClient.post("http://localhost:50000" + "/token", data, { headers: reqHeader });
    }

    getCurrentUser(): Observable<any> {
        return this.httpClient.get("http://localhost:50000" + "api/users/currentUser",
            { headers: new HttpHeaders({ "Authorization": "Bearer" + localStorage.getItem("userToken") }) });
    }
}
