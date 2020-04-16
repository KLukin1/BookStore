import { ValidationErrors, AbstractControl } from '@angular/forms';

export class CreateAccountValidators {

    static cannotContainSpace(control: AbstractControl): ValidationErrors | null {
        if ((control.value as string).indexOf(' ') >= 0) {
            return { cannotContainSpace: true }
        } else {
            return null;
        }
    }
}
