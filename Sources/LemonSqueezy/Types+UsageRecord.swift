//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

/// In Lemon Squeezy, a usage record is used to report the amount of usage for a subscription item when the product has [usage-based billing](https://docs.lemonsqueezy.com/help/products/usage-based-billing) enabled.
/// A usage record belongs to a [Subscription Item](https://docs.lemonsqueezy.com/api/subscription-items).
public struct UsageRecord: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this UsageRecord.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension UsageRecord {
    public struct APIResponse: Codable {
        let data: UsageRecord
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the subscription item this usage record belongs to.
        public let subscriptionItemId: Int
        
        /// A positive integer representing the usage to be reported.
        public let quantity: Int
        
        /// The type of record. One of:
        ///  - `increment` - The provided quantity was added to existing records for the current billing period.
        ///  - `set` - The provided quantity was set as the total usage for the current billing period.
        public let action: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension UsageRecord {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
