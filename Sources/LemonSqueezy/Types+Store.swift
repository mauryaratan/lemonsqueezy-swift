import Foundation

/// Everything in Lemon Squeezy belongs to a store. Each store can have multiple products, orders, discounts etc. and is billed separately. You can create a new store via the [Lemon Squeezy Dashboard](https://app.lemonsqueezy.com/settings/store/new).
///
/// A store can have many [Products](https://docs.lemonsqueezy.com/api/products), [Orders](https://docs.lemonsqueezy.com/api/orders), [Subscriptions](https://docs.lemonsqueezy.com/api/subscriptions), [Discounts](https://docs.lemonsqueezy.com/api/discounts) and [License Keys](https://docs.lemonsqueezy.com/api/license-keys).
public struct Store: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}


extension Store {
    public struct APIResponse: Codable {
        let data: Store
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The name of the store.
        public let name: String
        
        /// The slug used to identify the store.
        public let slug: String
        
        /// The domain of the store in the format `{slug}.lemonsqueezy.com`.
        public let domain: String
        
        /// The fully-qualified URL for the store (e.g. `https://{slug}.lemonsqueezy.com`).
        public let url: String
        
        /// The URL for the store avatar.
        public let avatarUrl: String
        
        /// The current billing plan for the store (e.g. `fresh`, `sweet`).
        public let plan: String?
        
        /// The [ISO 3166-1](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) two-letter country code for the store (e.g. US, GB, etc).
        public let country: String
        
        /// The full country name for the store (e.g. `United States`, `United Kingdom`, etc).
        public let countryNicename: String
        
        /// The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the store (e.g. `USD`, `GBP`, etc).
        public let currency: String
        
        /// A count of the all-time total sales made by this store.
        public let totalSales: Int
        
        /// A positive integer in cents representing the total all-time revenue of the store in USD.
        public let totalRevenue: Int
        
        /// A positive integer in cents representing the total revenue of the store in USD in the last 30 days.
        public let thirtyDaySales: Int
        
        /// A count of the sales made by this store in the last 30 days.
        public let thirtyDayRevenue: Int
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String?
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String?
    }
}

extension Store {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
