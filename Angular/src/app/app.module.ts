import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { MenuComponent } from './menu/menu.component';
import { AccountComponent } from './account/account.component';
import { BasketComponent } from './basket/basket.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { HomeComponent } from './home/home.component';
import { BooksComponent } from './books/books.component';
import { HttpClientModule } from '@angular/common/http'; 
import { OneBookComponent } from './one-book/one-book.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ForgotPassComponent } from './forgot-pass/forgot-pass.component';
import { CreateAccountComponent } from './create-account/create-account.component';
import { NotifierModule } from "angular-notifier";
import { MDBBootstrapModule } from 'angular-bootstrap-md';
import { CounterComponent } from './counter/counter.component';


@NgModule({
    declarations: [
        AppComponent,
        MenuComponent,
        AccountComponent,
        BasketComponent,
        SidebarComponent,
        HomeComponent,
        BooksComponent,
        OneBookComponent,
        ForgotPassComponent,
        CreateAccountComponent,
        CounterComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        HttpClientModule,
        FormsModule,
        ReactiveFormsModule,
        NotifierModule.withConfig({
            position: {
                horizontal: {
                    position: 'right'
                },
                vertical: {
                    position: 'top'
                }
            }
        }),
        MDBBootstrapModule.forRoot()
    ],
    providers: [],
    bootstrap: [AppComponent]
})
export class AppModule { }
