import { Directive, ElementRef } from '@angular/core';

@Directive({
  selector: '[appMainMap]'
})
export class MainMapDirective {

  constructor(Element: ElementRef) { 

    
  console.log("+++++++++++++++++++++++++++++++++++++++++++++++");
  console.log(Element);

  }


}
