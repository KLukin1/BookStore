import { Injectable } from '@angular/core';
import { map, catchError, retry } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, Subject } from 'rxjs';
import { CreatedUser } from '../models/created-user-model';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  site = 'https://klaras-book-store.azurewebsites.net/';

  constructor(private httpClient: HttpClient) { }

  createUser(user: CreatedUser): Observable<CreatedUser> {
    return this.httpClient.post(this.site + 'api/users/', user)
      .pipe(map(response => <CreatedUser>response));
  }

  userAuthentication(email: string, password: string): Observable<any> {
    var data = "username=" + email + "&password=" + password + "&grant_type=password";
    var reqHeader = new HttpHeaders({ "Content-Type": "application/x-www-urlencoded", "No-Auth": "True" });
    return this.httpClient.post(this.site + "token", data, { headers: reqHeader });
  }

  setCurrentUser(): Observable<any> {
    return this.httpClient.get(this.site + "api/users/currentUser");
  }

  static getCurrentUser(): any {
    var currentUser = localStorage.getItem('currentUser');
    return JSON.parse(currentUser);
  }


  private loginState = new Subject<any>();

  sendIsLoggedIn(isUserLoggedIn) {
    this.loginState.next(isUserLoggedIn);
  }

  getIsLoggedIn(): Observable<any> {
    return this.loginState.asObservable();
  }

}
