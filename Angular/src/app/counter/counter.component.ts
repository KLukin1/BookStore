import { Component, Input, Output } from '@angular/core';

@Component({
    selector: 'counter',
    templateUrl: 'counter.component.html',
    styleUrls: ['counter.component.less']
})
export class CounterComponent {

    @Input() counter: number;
    //@Output() counterr: number;

}
