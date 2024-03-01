import { Component, OnInit } from '@angular/core';
import { BasketItem } from '../models/basket-model';
import { BasketService } from '../services/basket-service';
import { UserService } from '../services/user-service';
import * as myGlobals from '../global-variables';


@Component({
  selector: 'history',
  templateUrl: './history.component.html',
  styleUrl: './history.component.less'
})
export class HistoryComponent implements OnInit {

    isUserLogged: boolean = false;
    isHistoryEmpty: boolean = true;
    history: BasketItem[][] = [];
    userId: number = -1;
    siteName: string = myGlobals.siteName;

    constructor(private basketService: BasketService) { }

    ngOnInit() {
        this.getIsLoggedIn();

        this.getHistory();
    }

    getIsLoggedIn() {
        if (UserService.getCurrentUser()) {
            this.userId = UserService.getCurrentUser()["UserId"];
            this.isUserLogged = true;
        } else {
            this.isUserLogged = false;
        }
    }

    getHistory() {
        this.basketService.getHistory().subscribe(
            response => {
                this.history = response;
                this.isHistoryEmpty = false;
            })
    }
}
