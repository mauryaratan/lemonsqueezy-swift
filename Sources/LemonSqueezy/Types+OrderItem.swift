//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

/// In Lemon Squeezy, an order item represents a line item for an order that includes product, variant and price information.
/// See [documentation](https://docs.lemonsqueezy.com/api/order-items)
public struct OrderItem: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension OrderItem {
    public struct APIResponse: Codable {
        let data: OrderItem
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the order this order item belongs to.
        public let orderId: Int
        
        /// The ID of the product associated with this order item.
        public let productId: Int
        
        /// The ID of the variant associated with this order item.
        public let variantId: Int
        
        /// The name of the product.
        public let productName: String
        
        /// The name of the variant.
        public let variantName: String
        
        /// A positive integer in cents representing the price of this order item (in the order currency).
        ///
        /// Note, for “pay what you want” products the price will be whatever the customer entered at checkout.
        public let price: Int
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension OrderItem {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
