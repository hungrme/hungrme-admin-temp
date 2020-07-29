import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import {MapComponent} from './map/map.component'
import { MyspaceComponent } from './myspace/myspace.component';

const routes: Routes = [
  { path: 'map', component: MapComponent },
  { path: 'myspace', component: MyspaceComponent },
  // {
  //   path: 'heroes',
  //   component: HeroListComponent,
  //   data: { title: 'Heroes List' }
  // },
  // { path: '',
  //   redirectTo: '/heroes',
  //   pathMatch: 'full'
  // },
  // { path: '**', component: PageNotFoundComponent }
];


@NgModule({
  imports: [RouterModule.forRoot(routes, { enableTracing: true } )],
  exports: [RouterModule]
})
export class AppRoutingModule { }
