import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AccountValidators } from '../services/account.validators';
import { UserService } from '../services/user-service';


@Component({
    selector: 'account',
    templateUrl: 'account.component.html',
    styleUrls: ['account.component.less']
})
export class AccountComponent implements OnInit {

    signInForm;

    constructor(private userService: UserService) { }

    ngOnInit() {
        this.signInForm = new FormGroup({
            Email: new FormControl('', [
                Validators.required,
                Validators.email
            ]),
            Password: new FormControl('', [
                Validators.required,
                AccountValidators.cannotContainSpace
            ])
        });
        this.userService.loginGET().subscribe(
            result => {
            });
    }

    get getEmail(): FormControl {
        return this.signInForm.get('Email');
    }
    get getPassword(): FormControl {
        return this.signInForm.get('Password');
    }

    onSignIn(f) {
        this.userService.userAuthentication(this.getEmail.value, this.getPassword.value).subscribe(
            result => {
                console.log(result);
            })
    }
}
