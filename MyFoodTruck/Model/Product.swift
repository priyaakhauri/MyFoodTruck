//
//  Product.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation

struct Product: Codable{
    var id:Int;
    var name:String="";
    var price:Double=0.0;
    var qty:Int;
}
