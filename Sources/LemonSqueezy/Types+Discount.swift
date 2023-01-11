//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct Discount: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Discount {
    public struct APIResponse: Codable {
        let data: Discount
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this discount belongs to.
        public let storeId: Int

        /// The name of the discount.
        public let name: String

        /// The discount code that can be used at checkout.
        public let code: String

        /// The amount of discount to apply to the order. Either a fixed amount or a percentage depending on the value of `amountType`.
        public let amount: Int

        /// The type of the amount. Either `percent` or `fixed`.
        public let amountType: String

        /// Has the value `true` if the discount can only be applied to certain products/variants.
        public let isLimitedToProducts: Bool

        /// Has the value `true` if the discount can only be redeemed a limited number of times.
        public let isLimitedRedemptions: Bool

        /// If `isLimitedRedemptions` is `true`, this is the maximum number of redemptions.
        public let maxRedemptions: Int

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the discount is valid from. Can be null if no start date is specified.
        public let startsAt: String?

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the discount expires. Can be null if no expiration date is specified.
        public let expiresAt: String?

        /// If the discount is applied to a subscription, this specifies how often the discount should be applied. One of `once`, `repeating`, `forever`.
        public let duration: String

        /// If `duration` is `repeating`, this specifies how many months the discount should apply
        public let durationInMonths: Int

        /// The status of the discount. Either `draft` or `published`.
        public let status: String

        /// The formatted status of the discount.
        public let statusFormatted: String

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
        
        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
    }
}

extension Discount {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
