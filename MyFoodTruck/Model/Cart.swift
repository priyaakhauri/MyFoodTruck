//
//  Cart.swift
//  MyFoodTruck
//
//  Created by Vishal Jaiswal on 21/5/22.
//

import Foundation


class Cart {
    
    func addToCart(product: Product){
        var products = Array<Product>();
        // Get Existing items in the list
        let cartSuite = UserDefaults(suiteName: "cart");
        print("Searching suite");
        if let data = cartSuite?.object(forKey: "cartItems"){
            do {
                print("Found suite");
                // Create JSON Decoder
                let decoder = JSONDecoder();
                // Decode
                products = try decoder.decode(Array<Product>.self, from: data as! Data)
                // If list isnt empty search for added item
                // else add in the list
                if(products.count>0){
                    print("products list have items");
                    let index = searchProduct(product: product, products: products);
                    if(index != -1){
                        print("Found product");
                        products[index].qty = product.qty;
                        print(products[index]);
                    }else{
                        print("Adding new product");
                        print(product);
                        products.append(product);
                    }
                }else{
                    print("Adding new product");
                    print(product);
                    products.append(product);
                }
                updateInUserDefault(products: products);
                
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }else{
            products.append(product);
            updateInUserDefault(products: products);
        }
    }
    
    func addToCart(productArr: Array<Product>){
        var products = Array<Product>();
        // Get Existing items in the list
        let cartSuite = UserDefaults(suiteName: "cart");
        if let data = cartSuite?.object(forKey: "cartItems"){
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder();
                // Decode
                products = try decoder.decode(Array<Product>.self, from: data as! Data)
                // If list isnt empty search for added item
                // else add in the list
                products = productArr;
                updateInUserDefault(products: products);
                
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }else{
            products = productArr;
            updateInUserDefault(products: products);
        }
    }
    
    func clearCart(){
        updateInUserDefault(products: Array<Product>());
        
    }
    
    func searchProduct(product:Product, products: Array<Product>) -> Int{
        for index in 0..<products.count {
            // if exist increase the qty
            if(product.id == products[index].id){
                return index;
            }
        }
        return -1;
    }
    
    func removeProduct(product: Product){
        var products: Array<Product>;
        // Get Existing items in the list
        let cartSuite = UserDefaults(suiteName: "cart");
        if let data = cartSuite?.object(forKey: "cartItems"){
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder();
                // Decode
                products = try decoder.decode(Array<Product>.self, from: data as! Data)
                // If list isnt empty search for added item
                // else add in the list
                if(products.count>0){
                    let index = searchProduct(product: product, products: products);
                    if(index != -1){
                        products.remove(at: index);
                    }
                }
                
                updateInUserDefault(products: products);
                
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
    
    func calculateTotalAmount() -> Shared{
        var products: Array<Product>;
        var total = Shared();
        // Get Existing items in the list
        let cartSuite = UserDefaults(suiteName: "cart");
        if let data = cartSuite?.object(forKey: "cartItems"){
            do {
                let decoder = JSONDecoder();
                products = try decoder.decode(Array<Product>.self, from: data as! Data)
                if(products.count>0){
                    for item in products {
                        total.totalQty += item.qty;
                        total.totalAmount += item.price * Double(item.qty);
                    }
                }
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return total;
    }
    
    func updateInUserDefault(products: Array<Product>){
        do {
            let cartSuite = UserDefaults(suiteName: "cart");
            // Save in the user default
            let encoder = JSONEncoder()
            // Encode
            let encodedProducts = try encoder.encode(products);
            cartSuite?.set(encodedProducts, forKey: "cartItems");
        } catch {
            print("Unable to Encode (\(error))")
        }
    }
    
    func getCartItems() -> Array<Product> {
        var products = Array<Product>();
        // Get Existing items in the list
        let cartSuite = UserDefaults(suiteName: "cart");
        if let data = cartSuite?.object(forKey: "cartItems"){
            do {
                print("Found suite");
                // Create JSON Decoder
                let decoder = JSONDecoder();
                // Decode
                products = try decoder.decode(Array<Product>.self, from: data as! Data)
                // If list isnt empty search for added item
                // else add in the list
                if(products.count>0){
                    return products;
                }else{
                    return Array<Product>();
                }
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return Array<Product>();
    }
    

}

