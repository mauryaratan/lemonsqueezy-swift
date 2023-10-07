//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

public struct SubscriptionInvoice: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}


extension SubscriptionInvoice {
    public struct APIResponse: Codable {
        let data: SubscriptionInvoice
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this subscription belongs to.
        public let storeId: Int
        
        /// The ID of the subscription associated with this subscription
        public let subscriptionId: Int
        
        /// The ID of the customer this subscription belongs to.
        public let customerId: Int
        
        /// The full name of the customer.
        public let userName: String
        
        /// The email address of the customer.
        public let userEmail: String
        
        /// The reason for the invoice being generated.
        ///  - `initial` - The initial invoice gnerated when the subscripiton is created.
        ///  - `renewal` - A renewal invoice generated when the subscription is renewed.
        ///  - `updated` - An invoice generated when the subscription is updated.
        public let billingReason: String
        
        /// Lowercase brand of the card used to pay for the latest subscription payment. One of `visa`, `mastercard`, `amex`, `discover`, `jcb`, `diners`, `unionpay`. Will be empty for non-card payments.
        public let cardBrand: String
        
        /// The last 4 digits of the card used to pay for the latest subscription payment. Will be empty for non-card payments.
        public let cardLastFour: String
        
        /// The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the order (e.g. `USD`, `GBP` etc.).
        public let currency: String
        
        /// If the order currency is USD, this will always be `1.0`. Otherwise, this is the currency conversion rate used to determine the cost of the order in USD at the time of purchase.
        public let currencyRate: String
        
        /// The status of the invoice. One of:
        ///  - `pending` - The invoice is waiting for payment.
        ///  - `paid` - The invoice has been paid.
        ///  - `void` - The invoice was cancelled or cannot be paid.
        ///  - `refunded` - The invoice was paid but has since been fully refunded.
        public let status: String
        
        /// The formatted status of the invoice.
        public let statusFormatted: String
        
        /// Has the value true if the order has been refunded.
        public let refunded: Bool
        
        /// If the order has been refunded, this will be an [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the order was refunded.
        public let refundedAt: String?
        
        /// A positive integer in cents representing the subtotal of the invoice in the invoice currency.
        public let subtotal: Int
        
        /// A positive integer in cents representing the total discount value applied to the invoice in the order currency.
        public let discountTotal: Int
        
        /// A positive integer in cents representing the tax applied to the order in the invoice currency.
        public let tax: Int
        
        /// A positive integer in cents representing the total cost of the order in the invoice currency.
        public let total: Int
        
        /// A positive integer in cents representing the subtotal of the order in USD.
        public let subtotalUsd: Int
        
        /// A positive integer in cents representing the total discount value applied to the order in USD.
        public let discountTotalUsd: Int
        
        /// A positive integer in cents representing the tax applied to the order in USD.
        public let taxUsd: Int
        
        /// A positive integer in cents representing the total cost of the order in USD.
        public let totalUsd: Int
        
        /// A human-readable string representing the subtotal of the order in the order currency (e.g. $9.99).
        public let subtotalFormatted: String
        
        /// A human-readable string representing the total discount value applied to the order in the order currency (e.g. $9.99).
        public let discountTotalFormatted: String
        
        /// A human-readable string representing the tax applied to the order in the order currency (e.g. $9.99).
        public let taxFormatted: String
        
        /// A human-readable string representing the total cost of the order in the order currency (e.g. $9.99).
        public let totalFormatted: String
        
        /// An object of customer-facing URLs for the invoice.
        public let urls: Urls

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String

        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
    }

    public struct Urls: Codable {
        /// The unique URL to download a PDF of the invoice. Note: for security reasons, download URLs are signed (but do not expire). Will be `null` if `status` is `pending`
        public let invoiceUrl: String?

    }
}

extension SubscriptionInvoice {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
