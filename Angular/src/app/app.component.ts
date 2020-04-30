import { Component, OnInit } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';
import { UserService } from './services/user-service';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.less']
})
export class AppComponent implements OnInit {

    isUserLogged: boolean = false;

    constructor(private router: Router, private userService: UserService) { this.getIsLoggedIn(); }

    ngOnInit() {
        this.router.events.subscribe(evt => {
            if (!(evt instanceof NavigationEnd)) {
                return;
            }
            window.scrollTo(0, 0);
        });
    }

    getIsLoggedIn() {
        this.userService.getIsLoggedIn().subscribe(
            result => {
                if (result) {
                    this.isUserLogged = true;
                } else {
                    this.isUserLogged = false;
                }
            })
    }

    logout() {
        this.isUserLogged = false;
        this.userService.sendIsLoggedIn(false);
        window.location.reload();
    }
}
