//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 28/03/23.
//

import Foundation

public struct Customer: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Customer {
    public struct APIResponse: Codable {
        let data: Customer
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this order belongs to.
        public let storeId: Int
        
        /// The full name of the customer.
        public let name: String
        
        /// The email address of the customer.
        public let email: String
        
        /// The email marketing status of the customer. One of:
        /// - `subscribed` - This customer is subscribed to marketing emails.
        /// - `unsubscribed` - This customer has unsubscribed from marketing emails.
        /// - `archived` - This customer has been archived and will no longer recieve marketing emails.
        /// - `requires_verification` - The customers email address need to be verified (happens automatically).
        /// - `invalid_email` - The customers email address has failed validation.
        /// - `bounced` - The customers email has hard bounced.
        public let status: String
        
        /// The city of the customer.
        public let city: String?
        
        /// The region of the customer.
        public let region: String?
        
        /// The country of the customer.
        public let country: String?
        
        /// A positive integer in cents representing the total revenue from the customer (USD).
        public let totalRevenueCurrency: Int
        
        /// A positive integer in cents representing the monthly recurring revenue from the customer (USD).
        public let mrr: Int
        
        /// The formatted status of the customer.
        public let statusFormatted: String
        
        /// The formatted country of the customer.
        public let countryFormatted: String?
        
        /// A human-readable string representing the total revenue from the customer (e.g. $9.99).
        public let totalRevenueCurrencyFormatted: String
        
        /// A human-readable string representing the monthly recurring revenue from the customer (e.g. $9.99).
        public let mrrFormatted: String
        
        /// An object of customer-facing URLs. It contains:
        public let urls: Urls
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
        
        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
    }
    
    public struct Urls: Codable {
        /// A pre-signed URL to the [Customer Portal](https://docs.lemonsqueezy.com/help/online-store/customer-portal), which allows customers to fully manage their subscriptions and billing information from within your application. The URL is valid for 24 hours from time of request. Will be null if the customer has not bought a subscription in your store.
        public let customerPortal: String
    }

}

extension Customer {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
