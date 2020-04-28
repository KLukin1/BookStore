import { Component, OnInit } from '@angular/core';
import { BasketService } from '../services/basket-service';
import { Router } from '@angular/router';
import { NotifierService } from 'angular-notifier';
import { UserService } from '../services/user-service';


@Component({
    selector: 'menu',
    templateUrl: 'menu.component.html',
    styleUrls: ['menu.component.less']
})
export class MenuComponent implements OnInit {

    basketNum: number;
    isHamburgerClicked: boolean = false;

    constructor(private basketService: BasketService, private router: Router,
        private notifier: NotifierService, private userService: UserService) { this.getBasketCount(); }

    ngOnInit() {
        this.getBasketCountApi();
        this.userService.getCurrentUser().subscribe(
            data => {
            })
    }

    getBasketCountApi() {
        this.basketService.getBasketCountApi().subscribe(
            result => {
                this.basketNum = result;
            })
    }

    getBasketCount() {
        this.basketService.getBasketNum().subscribe(
            result => {
                this.getBasketCountApi();
            })
    }

    showSideMenu(bool: boolean) {
        this.isHamburgerClicked = bool;
    }

    logout() {
        localStorage.removeItem('userToken');
        this.router.navigate(['/account']);
        this.notifier.notify("success", "You have logged out");
    }
}

