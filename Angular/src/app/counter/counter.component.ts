import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
    selector: 'counter',
    templateUrl: 'counter.component.html',
    styleUrls: ['counter.component.less']
})
export class CounterComponent {

    @Input() counter: number;
    @Output() change = new EventEmitter<boolean>();

    changeCount(c: boolean) {
        this.change.emit(c);
    }
}
