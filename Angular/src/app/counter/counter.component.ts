import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
    selector: 'counter',
    templateUrl: 'counter.component.html',
    styleUrls: ['counter.component.less']
})
export class CounterComponent {

    @Input() counter: number;
    @Output() change = new EventEmitter<number>();

    changeCount(c: boolean) {
        if (c == true) {
            this.counter += 1;
        } else if (c == false && this.counter == 1) {
            this.counter = 1;
        } else {
            this.counter -= 1;
        }
        this.change.emit(this.counter);
    }
}
