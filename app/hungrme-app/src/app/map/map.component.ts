import { Component, OnInit, ElementRef , HostBinding } from '@angular/core';
import {FormControl, FormGroup} from '@angular/forms';
import  *  as  styless  from  '../map/map-styles.json';
import { Observable, observable, of } from 'rxjs';
import { map, catchError, debounceTime , startWith, switchMap } from 'rxjs/operators';
import { MapRestaurantItem, Items, MapRestaurantResponse } from './models/map-restaurant-model';;
import { MapServices } from './services/map-services.service';

import {
  trigger,
  state,
  style,
  animate,
  transition,
  // ...
} from '@angular/animations';

@Component({
  selector: 'app-map',
  styles: ['agm-map {  /*height: 500px;  height is required */ }'],
  // template: ` `,
   templateUrl: './map.component.html',
   styleUrls: ['./map.component.scss'],
   animations: [
    trigger('openClose', [
      // ...
      state('open', style({
        height: '500px',
        opacity: 1,
        backgroundColor: 'yellow'     
      })),
      state('closed', style({
        height: '300px',
        opacity: 0.5,
        backgroundColor: 'green'
      })),
      transition('open => closed', [
        animate('0.3s')
      ]),
      transition('closed => open', [
        animate('0.2s')
      ]),
    ]),
  ],
})


export class MapComponent implements OnInit {
  public innerHeight: any;
  public addressAutoComplete$: Observable<Items> = null;
  public addressCompleteControl = new FormControl();

  lookup(value: string): Observable<Items> {
    return this.mapServices.search(value.toLowerCase()).pipe(
      // map the item property of the github results as our return object
      map(results => results.items), 
      // catch errors
      catchError(_ => {
        return of(null);
      })
    );
  }

  look;
  ngOnInit() {
    this.searchForm = new FormGroup({
      userName: new FormControl()
   });


    this.innerHeight = window.innerHeight;
    
    //el.nativeElement.style.height
    console.log(window.innerHeight);
    //nav + search height = 140
    this.hgt = (this.innerHeight-270)+'px';

    
    this.addressAutoComplete$ = this.addressCompleteControl.valueChanges.pipe(
      startWith(''),
      // delay emits
      debounceTime(300),
      // use switch map so as to cancel previous subscribed events, before creating new once
      switchMap(value => {
        if (value !== '') {
          console.log("hello")
          this.look = this.lookup(value);

          console.log(this.addressAutoComplete$)
          // lookup from github
          return this.lookup(value);
        } else {
          // if no value is pressent, return null
          return of(null);
        }
      })
    );
  }
  

  styles = 
[
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#f5f5f5"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#f5f5f5"
        }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#bdbdbd"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#eeeeee"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#e5e5e5"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#ffffff"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#bbd0fb"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#dadada"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#dbe6fd"
        }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#e5e5e5"
        }
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#eeeeee"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#c9c9c9"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#6aa3ee"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    }
  ];


  constructor(private mapServices: MapServices) {}

   isOpen = false;

   toggle() {
    
   }

  

  hgt='900px'

   
  startTypePlaceholder = 'Type anything';
  searchForm;

  public open(event) {
    console.log("ok", this.searchForm.value.userName)
  }


  
  latitude = 29.68352;
  longitude = -81.70785;
  mapType = 'roadmap';


  selectedMarker;
  markers = [
    { lat: 22.33159, lng: 105.63233, alpha: 1 },
    // { lat: 7.92658, lng: -12.05228, alpha: 1 },
    // { lat: 48.75606, lng: -118.859, alpha: 1 },
    // { lat: 5.19334, lng: -67.03352, alpha: 1 },
    // { lat: 12.09407, lng: 26.31618, alpha: 1 },
    // { lat: 47.92393, lng: 78.58339, alpha: 1 }
  ];

  values;
  onKey(event: any) { // without type info
    if (event.key === "Enter") {
    this.values += event.target.value + ' | ';
    }
  }
  
  addMarker(lat: number, lng: number) {
    this.markers.push({ lat, lng, alpha: 1 });
  }

  max(coordType: 'lat' | 'lng'): number {
    return Math.max(...this.markers.map(marker => marker[coordType]));
  }

  min(coordType: 'lat' | 'lng'): number {
    return Math.min(...this.markers.map(marker => marker[coordType]));
  }

  selectMarker(event) {
    this.selectedMarker = {
      lat: event.latitude,
      lng: event.longitude
    };
  }

//   @HostBinding('@animSlide')

//   isDivIn = false;
//   animationDone(event: AnimationEvent) {
//     this.isDivIn = true; //or false, depends on your specific logic
// }

  onSearchChange(searchValue: string): void {  
    console.log(searchValue.length);
    if (searchValue.length < 1 ){ 

    this.startTypePlaceholder = "Type Anything"
    // this.isOpen = false;
   // this.hgt = (this.innerHeight/2)+'px';
    return;
  }

    // this.isOpen = true;
   // this.hgt = (this.innerHeight-80)+'px';
    this.startTypePlaceholder = "try 'nearby restaurants' , 'italian food under 10' "
    
  }
  // console.log("mko");

}
