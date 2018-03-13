import { Component, OnInit } from '@angular/core';

import { User } from '../_models/index';

import { AuthenticationService, MovieService } from '../_services';



@Component({
    moduleId: module.id,
    templateUrl: 'home.component.html'
})

export class HomeComponent implements OnInit {
    currentUser: User;
    message: String;

    constructor(
        private authenticationService: AuthenticationService,
        private movieService: MovieService
    ) {
        this.currentUser = JSON.parse(localStorage.getItem('currentUser'));
    }

    ngOnInit() {
        this.authenticationService.test()
            .subscribe( message => {
                this.message = message;
            });
    }

    getList() {
        this.movieService.getList()
            .subscribe(
                data => {
                    //success
                    this.message = JSON.stringify(data, null, 2);
                },
                error => {
                    //whoops
                });
    }
}