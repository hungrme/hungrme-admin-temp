import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'hungrme-app';

  
  showMePartially  = false
  public showSignInForm(event) {
    this.showMePartially = !this.showMePartially;
  }
}
