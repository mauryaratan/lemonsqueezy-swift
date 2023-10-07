import Foundation

/// In Lemon Squeezy, an [order](https://docs.lemonsqueezy.com/api/orders#the-order-object) is created when a customer purchases a product.
///
/// An order belongs to a [Store](https://docs.lemonsqueezy.com/api/stores) and can have many [Order Items](https://docs.lemonsqueezy.com/api/order-items), [Subscriptions](https://docs.lemonsqueezy.com/api/subscriptions) and [License Keys](https://docs.lemonsqueezy.com/api/license-keys).
public struct Order: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Order {
    public struct APIResponse: Codable {
        let data: Order
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this order belongs to.
        public let storeId: Int
        
        /// The ID of the customer this subscription belongs to.
        public let customerId: Int?
        
        /// The unique identifier (UUID) for this order.
        public let identifier: String
        
        /// An integer representing the sequential order number for this store.
        public let orderNumber: Int

        /// The full name of the customers.
        public let userName: String?
        
        /// The email address of the customer.
        public let userEmail: String?
        
        /// The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the order (e.g. `USD`, `GBP` etc.).
        public let currency: String
        
        /// If the order currency is USD, this will always be `1.0`. Otherwise, this is the currency conversion rate used to determine the cost of the order in USD at the time of purchase.
        public let currencyRate: String
        
        /// A positive integer in cents representing the subtotal of the order in the order currency.
        public let subtotal: Int
        
        /// A positive integer in cents representing the total discount value applied to the order in the order currency.
        public let discountTotal: Int
        
        /// A positive integer in cents representing the tax applied to the order in the order currency.
        public let tax: Int
        
        /// A positive integer in cents representing the total cost of the order in the order currency.
        public let total: Int
        
        /// A positive integer in cents representing the subtotal of the order in USD.
        public let subtotalUsd: Int
        
        /// A positive integer in cents representing the total discount value applied to the order in USD.
        public let discountTotalUsd: Int
        
        /// A positive integer in cents representing the tax applied to the order in USD.
        public let taxUsd: Int
        
        /// A positive integer in cents representing the total cost of the order in USD.
        public let totalUsd: Int
        
        /// If tax is applied to the order, this will be the name of the tax rate (e.g. `VAT`, `Sales Tax`, etc).
        public let taxName: String?
        
        /// If tax is applied to the order, this will be the rate of tax as a decimal percentage.
        public let taxRate: String
        
        /// The status of the order. One of `pending`, `failed`, `paid`, `refunded`.
        public let status: String
        
        /// The formatted status of the order.
        public let statusFormatted: String
        
        /// Has the value true if the order has been refunded.
        public let refunded: Bool
        
        /// If the order has been refunded, this will be an [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the order was refunded.
        public let refundedAt: String?
        
        /// A human-readable string representing the subtotal of the order in the order currency (e.g. $9.99).
        public let subtotalFormatted: String
        
        /// A human-readable string representing the total discount value applied to the order in the order currency (e.g. $9.99).
        public let discountTotalFormatted: String
        
        /// A human-readable string representing the tax applied to the order in the order currency (e.g. $9.99).
        public let taxFormatted: String
        
        /// A human-readable string representing the total cost of the order in the order currency (e.g. $9.99).
        public let totalFormatted: String
        
        /// An object representing the first [order item](https://docs.lemonsqueezy.com/api/order-items) belonging to this order.
        //public let firstOrderItem: FirstOrderItem
        
        /// An object of customer-facing URLs for this order.
        public let urls: Urls
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
    
    /// An object containing first order item from the order.
    public struct FirstOrderItem: Codable {
        /// The ID of the order.
        public let orderId: Int
        
        /// The ID of the product.
        public let productId: Int
        
        /// The ID for the product variant.
        public let variantId: Int
        
        /// The name of the product.
        public let productName: String
        
        /// The name of the product variant.
        public let variantName: String
        
        /// A positive integer in cents representing the price of the order item in the order currency.
        public let price: Int
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
    
    public struct Urls: Codable {
        /// A pre-signed URL for viewing the order in the customer's [My Orders](https://docs.lemonsqueezy.com/help/online-store/my-orders) page.
        public let receipt: String
    }
}

extension Order {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
