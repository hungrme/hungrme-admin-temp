import { TestBed } from '@angular/core/testing';

import { MapServicesService } from './map-services.service';

describe('MapServicesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: MapServicesService = TestBed.get(MapServicesService);
    expect(service).toBeTruthy();
  });
});
