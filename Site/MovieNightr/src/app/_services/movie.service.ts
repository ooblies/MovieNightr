import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { environment } from '../../environments/environment';
import 'rxjs/add/operator/map'

import { AuthenticationService } from './authentication.service';

@Injectable()
export class MovieService {


    constructor(
       private http: Http,
       private authenticationService: AuthenticationService,
    ) { }

    getList() {
        let headers = new Headers( { 'Authorization' : 'Bearer ' + this.authenticationService.access_token } );
        let options = new RequestOptions({ headers: headers});

        return this.http.get(environment.apiBaseUrl + '/movies/GetMovieList', options)
            .map((response: Response) => {
                //do stuff
                return response.json();
            });
    }
}