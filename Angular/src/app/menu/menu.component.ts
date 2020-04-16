import { Component } from '@angular/core';

@Component({
    selector: 'menu',
    templateUrl: 'menu.component.html',
    styleUrls: ['menu.component.less']
})
export class MenuComponent {

    test = [
        { title: "szfvm", price: 20 },
        { title: "omzf", price: 10 },
        { title: "lzlvm", price: 15 }
    ];

    autocomplete(inputSearch: string) {
       
    }
}

