import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AccountValidators } from '../services/account.validators';
import { UserService } from '../services/user-service';
import { Router } from '@angular/router';
import { HttpErrorResponse } from '@angular/common/http';
import { NotifierService } from 'angular-notifier';


@Component({
    selector: 'account',
    templateUrl: 'account.component.html',
    styleUrls: ['account.component.less']
})
export class AccountComponent implements OnInit {

    signInForm;
    isLoginError: boolean = false;

    constructor(private userService: UserService, private router: Router, private notifier: NotifierService) { }

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
    }

    get getEmail(): FormControl {
        return this.signInForm.get('Email');
    }
    get getPassword(): FormControl {
        return this.signInForm.get('Password');
    }

    onSignIn(f) {
        this.userService.userAuthentication(this.getEmail.value, this.getPassword.value).subscribe(
            data => {
                localStorage.setItem('userToken', data.access_token);
                this.router.navigate(['/home']);
            },
            (err: HttpErrorResponse) => {
                this.isLoginError = true;
            })
    }
}
