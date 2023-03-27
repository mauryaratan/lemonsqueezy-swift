//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 27/03/23.
//

import Foundation

public struct DiscountRedemption: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension DiscountRedemption {
    public struct APIResponse: Codable {
        let data: DiscountRedemption
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the discount this redemption belongs to.
        public let discountId: Int
        
        /// The ID of the order this redemption belongs to.
        public let orderId: Int
        
        /// The name of the discount.
        public let discountName: String
        
        /// The discount code that was used at checkout.
        public let discountCode: String
        
        /// The amount of the discount. Either a fixed amount in cents or a percentage depending on the value of `discount_amount_type`.
        public let discountAmount: Int
        
        /// The type of the `discount_amount`. Either `percent` or `fixed`.
        public let discountAmountType: String
        
        /// A positive integer in cents representing the amount of the discount that was applied to the order (in the order currency).
        public let amount: Int

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension DiscountRedemption {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
