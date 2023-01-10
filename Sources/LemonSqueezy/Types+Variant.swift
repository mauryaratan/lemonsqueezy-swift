import Foundation

/// In Lemon Squeezy, a product can have one or more variants. A variant represents a different option that is presented to the customer at checkout and has its own unique set of pricing options, files and license key settings.
///
/// A product will always have at least one variant. If only one variant exists for a product, it is considered the “default” variant and is not shown as a separate option at checkout. It will also have a `pending` status.
public struct Variant: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this variant.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Variant {
    public struct APIResponse: Codable {
        let data: Variant
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the product this variant belongs to.
        public let productId: Int
        
        /// The name of the variant.
        public let name: String
        
        /// The slug used to identify the variant.
        public let slug: String
        
        /// The description of the variant in HTML.
        public let description: String?
        
        /// A positive integer in cents representing the price of the variant.
        public let price: Int
        
        /// Has the value `true` if this variant is a subscription
        public let isSubscription: Bool
        
        /// If this variant is a subscription, this is the frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
        public let interval: String?
        
        /// If this variant is a subscription, this is the number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
        public let intervalCount: Int?
        
        /// Has the value true if this variant has a free trial period. Only available if the variant is a subscription.
        public let hasFreeTrial: Bool
        
        /// The interval unit of the free trial. One of `day`, `week`, `month` or `year`.
        public let trialInterval: String
        
        /// If interval count of the free trial. For example, a variant with `trial_interval=day` and `trial_interval_count=14` would have a free trial that lasts 14 days.
        public let trialIntervalCount: Int?
        
        /// Has the value `true` if this is a “pay what you want” variant where the price can be set by the customer at checkout.
        public let payWhatYouWant: Bool
        
        /// If `payWhatYouWant` is `true`, this is the minimum price this variant can be purchased for, as a positive integer in cents
        public let minPrice: Int
        
        /// If `payWhatYouWant` is `true`, this is the suggested price for this variant shown at checkout, as a positive integer in cents
        public let suggestedPrice: Int
        
        /// Has the value `true` if this variant should generate license keys for the customer on purchase.
        public let hasLicenseKeys: Bool
        
        /// The maximum number of times a license key can be activated for this variant.
        public let licenseActivationLimit: Int
        
        /// Has the value `true` if license key activations are unlimited for this variant.
        public let isLicenseLimitUnlimited: Bool
        
        /// The number of units (specified in the license_length_unit attribute) until a license key expires.
        public let licenseLengthValue: Int
        
        /// The unit linked with the `license_length_value` attribute. One of `days`, `months` or `years`. For example, `license_length_value=3` and `license_length_unit=months` license keys will expire after 3 months.
        public let licenseLengthUnit: String
        
        /// Has the value true if license keys should never expire.
        ///
        /// Note: If the variant is a subscription, the license key expiration will be linked to the status of the subscription (e.g. the license will expire when the subscription expires).
        public let isLicenseLengthUnlimited: Bool
        
        /// An integer representing the order of this variant when displayed on the checkout.
        public let sort: Int
        
        /// The status of the variant. Either `pending`, `draft` or `published`. If a variant has a `pending` status, it is considered the “default” variant and is not shown as a separate option at checkout.
        public let status: String
        
        /// The formatted status of the variant.
        public let statusFormatted: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension Variant {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
