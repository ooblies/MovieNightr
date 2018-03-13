import { Injectable } from '@angular/core';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { environment } from '../../environments/environment';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {
    public access_token: string;

    constructor(
       private http: Http,
    ) {
        var currentUser = JSON.parse(localStorage.getItem('currentUser'));
        this.access_token = currentUser && currentUser.access_token;
     }

    test() {
        let headers = new Headers( { 'Authorization' : 'Bearer ' + this.access_token } );
        let options = new RequestOptions({ headers: headers});

        return this.http.get(environment.apiBaseUrl + '/account/test', options)
            .map((response: Response) => response.json());
    }

    register(email: string, username: string, password: string, confirmPassword: string) {
        let headers = new Headers({ 'Content-Type':'application/json' });
        let options = new RequestOptions({ headers: headers});

        return this.http.post(environment.apiBaseUrl + '/account/register', JSON.stringify({ UserName: username, 
                                                                                             Password: password, 
                                                                                             Email: email,
                                                                                             ConfirmPassword: confirmPassword }), options)
            .map((response: Response) => {
                let user = response.json();
                if (user && user.access_token) {
                    localStorage.setItem('currentUser', JSON.stringify(user));
                }
                
                return user;
            });
    }

    login(username: string, password: string) {        
        return this.http.post(environment.apiBaseUrl + '/auth/token', 'grant_type=password&username=' + username + '&password=' + password)
            .map((response: Response) => {
                // login successful if there's a jwt token in the response
                let user = response.json();
                if (user && user.access_token) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user));
                    this.access_token = user.access_token;
                }

                return user;
            });
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
    }
}