export interface MapRestaurantItem {
    id: number;
    branchName: string;
    address: string;
    locality: string;
    region: string;
    country: string;
    lat: boolean;
    lng: string;
}

export declare type Items = MapRestaurantItem[];

export interface MapRestaurantResponse {
  total_count: number;
  incomplete_results: boolean;
  items: Items;
}