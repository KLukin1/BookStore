import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, FormGroupDirective, Validators } from '@angular/forms';
import { UserService } from '../services/user-service';
import { NotifierService } from 'angular-notifier';
import { AccountValidators } from '../services/account.validators';
import { Router } from '@angular/router';


@Component({
    selector: 'create-account',
    templateUrl: 'create-account.component.html',
    styleUrls: ['create-account.component.less']
})
export class CreateAccountComponent implements OnInit {

    registerForm;

    constructor(private userService: UserService, private notifier: NotifierService,
        private router: Router) { }

    ngOnInit() {
        this.registerForm = new FormGroup({
            FirstName: new FormControl('', Validators.required),
            LastName: new FormControl('', Validators.required),
            DeliveryAddress: new FormControl('', Validators.required),
            Email: new FormControl('', [
                Validators.required,
                Validators.email,
            ]),
            Password: new FormControl('', [
                Validators.required,
                AccountValidators.cannotContainSpace
            ]),
            ConfirmPassword: new FormControl('', Validators.required)
        });
    }

    onRegister(f: FormGroupDirective) {
        this.userService.createUser(f.value).subscribe(
            result => {
                this.notifier.notify("success", "Hello " + f.value.FirstName);
                this.router.navigateByUrl('/home');
            })
    }

    get getFirstName() {
        return this.registerForm.get('FirstName');
    }
    get getLastName() {
        return this.registerForm.get('LastName');
    }
    get getDeliveryAddress() {
        return this.registerForm.get('DeliveryAddress');
    }
    get getEmail() {
        return this.registerForm.get('Email');
    }
    get getPassword() {
        return this.registerForm.get('Password');
    }
    get getConfirmPassword() {
        return this.registerForm.get('ConfirmPassword');
    }
}
