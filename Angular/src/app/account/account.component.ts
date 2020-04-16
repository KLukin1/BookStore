import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl } from '@angular/forms';


@Component({
    selector: 'account',
    templateUrl: 'account.component.html',
    styleUrls: ['account.component.less']
})
export class AccountComponent implements OnInit {

    user;
    signInForm;
    email: string;
    password: string;

    ngOnInit() {
        this.signInForm = new FormGroup({
            email: new FormControl(),
            password: new FormControl()
        });
    }

    onSignIn(f) {
        console.log(f.value);
    }
}
