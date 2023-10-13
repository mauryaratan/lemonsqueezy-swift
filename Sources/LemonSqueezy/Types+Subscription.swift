//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct Subscription: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}


extension Subscription {
    public struct APIResponse: Codable {
        let data: Subscription
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this subscription belongs to.
        public let storeId: Int
        
        /// The ID of the customer this subscription belongs to.
        public let customerId: Int

        /// The ID of the order associated with this subscription.
        public let orderId: Int

        /// The ID of the order item associated with this subscription.
        public let orderItemId: Int

        /// The ID of the product associated with this subscription.
        public let productId: Int

        /// The ID of the variant associated with this subscription.
        public let variantId: Int

        /// The name of the product.
        public let productName: String

        /// The name of the variant.
        public let variantName: String

        /// The full name of the customer.
        public let userName: String

        /// The email address of the customer.
        public let userEmail: String

        /// The status of the subscription. One of `on_trial`, `active`, `cancelled`, `expired`.
        public let status: String

        /// The formatted status of the subscription.
        public let statusFormatted: String
        
        /// Lowercase brand of the card used to pay for the latest subscription payment. One of `visa`, `mastercard`, `amex`, `discover`, `jcb`, `diners`, `unionpay`. Will be empty for non-card payments.
        public let cardBrand: String
        
        /// The last 4 digits of the card used to pay for the latest subscription payment. Will be empty for non-card payments.
        public let cardLastFour: String

        /// An object containing the payment collection pause behaviour options for the subscription.
        public let pause: Pause?

        /// A boolean indicating if the subscription has been cancelled.
        public let cancelled: Bool

        /// If the subscription has a free trial, this will be an [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the trial period ends.
        public let trialEndsAt: String?

        /// An integer representing a day of the month (21 equals 21st day of the month). This is the day of which subscription invoice payments are collected.
        public let billingAnchor: Int
        
        /// An object representing the first [subscription item](https://docs.lemonsqueezy.com/api/subscription-items) belonging to this subscription.
        public let firstSubscriptionItem: FirstSubscriptionItem

        /// An object of customer-facing URLs for managing the subscription.
        public let urls: Urls

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating the end of the current billing cycle, and when the next invoice will be issued.
        public let renewsAt: String?

        /// If the subscription has been cancelled, this will be an [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the subscription expires.
        public let endsAt: String?

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String

        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
    }
    
    public struct Pause: Codable {
        /// Defines payment pause behaviour, can be one of:
        ///  - `void` - If you can't offer your services for a period of time (for maintenance as an example), you can void invoices so your customers aren't charged
        ///  - `free` - Offer your subscription services for free, whilst halting payment collection.
        public let mode: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the subscription will continue collecting payments.
        public let resumesAt: String?
    }
    
    public struct FirstSubscriptionItem: Codable {
        /// The ID of the subscription item.
        public let id: Int
        
        /// The ID of the subscription.
        public let subscriptionId: Int
        
        /// The ID of the price.
        public let priceId: Int
        
        /// The quantity of the subscription item.
        public let quantity: Int
        
        /// Where it's usage based subscription item.
        public let isUsageBased: Bool
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
    
    public struct Urls: Codable {
        /// A pre-signed URL for managing payment and billing information for the subscription. This can be used in conjunction with [Lemon.js](https://docs.lemonsqueezy.com/help/lemonjs/what-is-lemonjs) to allow your customer to change their billing information from within your application. The URL is valid for 24 hours from time of request.
        public let updatePaymentMethod: String
        
        /// A pre-signed URL to the [Customer Portal](https://docs.lemonsqueezy.com/help/online-store/customer-portal), which allows customers to fully manage their subscriptions and billing information from within your application. The URL is valid for 24 hours from time of request.
        public let customerPortal: String
    }
}

extension Subscription {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
