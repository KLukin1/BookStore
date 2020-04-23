import { Component, OnInit } from '@angular/core';
import { BasketService } from '../services/basket-service';
import { Subscription } from 'rxjs';


@Component({
    selector: 'menu',
    templateUrl: 'menu.component.html',
    styleUrls: ['menu.component.less']
})
export class MenuComponent implements OnInit {

    basketNum: number;

    constructor(private basketService: BasketService) { this.getBasketCount(); }

    ngOnInit() {
        this.getBasketCountApi();
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

    autocomplete(inputSearch: string) {

    }
}

