import Foundation

/// In Lemon Squeezy, products describe the digital goods you offer to your customers.
///
/// A product belongs to a [Store](https://docs.lemonsqueezy.com/api/stores) and can have many [Variants](https://docs.lemonsqueezy.com/api/variants).
public struct Product: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this product.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Product {
    public struct APIResponse: Codable {
        let data: Product
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this product belongs to.
        public let storeId: Int
        
        /// The name of the product.
        public let name: String
        
        /// The slug used to identify the product.
        public let slug: String
        
        /// The description of the product in HTML.
        public let description: String?
        
        /// The status of the product. Either `draft` or `published`.
        public let status: String
        
        /// The formatted status of the product.
        public let statusFormatted: String
        
        /// A URL to the thumbnail image for this product (if one exists). The image will be 100x100px in size.
        public let thumbUrl: String?
        
        /// A URL to the large thumbnail image for this product (if one exists). The image will be 1000x1000px in size.
        public let largeThumbUrl: String?
        
        /// A positive integer in cents representing the price of the product.
        public let price: Int
        
        /// Has the value `true` if this is a “pay what you want” product where the price can be set by the customer at checkout.
        public let payWhatYouWant: Bool
        
        /// If this product has multiple variants, this will be a positive integer in cents representing the price of the cheapest variant. Otherwise, it will be `null`.
        public let fromPrice: Int?
        
        /// If this product has multiple variants, this will be a positive integer in cents representing the price of the most expensive variant. Otherwise, it will be `null`.
        public let toPrice: Int?
        
        /// A URL to purchase this product using the Lemon Squeezy checkout.
        public let buyNowUrl: String
        
        /// A human-readable string representing the price of the product (e.g. $9.99).
        public let priceFormatted: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}


extension Product {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
