import { Component, OnInit, OnChanges } from '@angular/core';
import { BasketService } from '../services/basket-service';

@Component({
    selector: 'menu',
    templateUrl: 'menu.component.html',
    styleUrls: ['menu.component.less']
})
export class MenuComponent implements OnInit, OnChanges {

    basketNum: number;

    constructor(private basketService: BasketService) { }

    ngOnInit() {
        this.loadBasketNum();
    }
    ngOnChanges() {
        this.loadBasketNum();
    }

    loadBasketNum() {
        this.basketService.getBasketNum().subscribe(
            result => {
                this.basketNum = result;
            }
        )
    }

    autocomplete(inputSearch: string) {

    }
}

