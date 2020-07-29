import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { MapRestaurantResponse, MapRestaurantItem } from '../models/map-restaurant-model';

@Injectable({
  providedIn: 'root'
})
export class MapServices {

  constructor(private http: HttpClient) { }


  search(query: string): Observable<MapRestaurantResponse> {
    const url = '/api/search/';
    return this.http
      .get<MapRestaurantResponse>(url, {
        observe: 'response',
        params: {
          q: query
        }
      })
      .pipe(
        map(res => {
          console.log(res.body);
          return res.body;

        })
      );
  }
}
