//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

/// In Lemon Squeezy, a price object represents a price added to a variant.
/// When a variant's price is changed a new price object is created. All old prices are retained.
/// A price belongs to a [Variant](https://docs.lemonsqueezy.com/api/variants) and can have many [Subscription Items](https://docs.lemonsqueezy.com/api/subscription-items) and [Usage records](https://docs.lemonsqueezy.com/api/usage-records).
public struct Price: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this product.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Price {
    public struct APIResponse: Codable {
        let data: Price
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the variant this price belongs to.
        public let variantId: Int
        
        /// The type of variant this price was created for. One of:
        ///  - `one_time` - A regular product
        ///  - `subscription` - A subscription
        ///  - `lead_magnet` - A free lead magnet
        ///  - `pwyw` - "Pay what you want" product
        public let category: String
        
        /// The pricing model for this price. One of:
        ///  - `standard`
        ///  - `package`
        ///  - `graduated`
        ///  - `volume`
        public let scheme: String
        
        /// The type of usage aggregation in use if usage-based billing is activated. One of:
        ///  - `sum` - Sum of usage during period
        ///  - `last_during_period` - Most recent usage during a period
        ///  - `last_ever` - Most recent usage
        ///  - `max` - Maximum usage during period
        public let usageAggregation: String?
        
        /// A positive integer in cents representing the price.
        /// Not used for volume and graduated pricing (tier data is used instead).
        public let unitPrice: Int
        
        /// The number of units included in each package when using package pricing.
        /// Will be `1` for standard, graduated and volume pricing.
        public let packageSize: Int
        
        /// A list of pricing tier objects when using volume and graduated pricing.
        public let tiers: [Tiers]?
        
        /// If the price's variant is a subscription, the billing interval. One of:
        ///  - `day`
        ///  - `week`
        ///  - `month`
        ///  - `year`
        /// Will be null if the product is not a subscription.
        public let renewalIntervalUnit: String?
        
        /// If the price's variant is a subscription, this is the number of intervals (specified in the `renewal_interval_unit` attribute) between subscription billings.
        /// For example, `renewal_interval_unit=month` and `renewal_interval_quantity=3` bills every 3 months.
        /// Will be `null` if the product is not a subscription.
        public let renewalIntervalQuantity: Int?
        
        /// The interval unit of the free trial. One of:
        ///  - `day`
        ///  - `week`
        ///  - `month`
        ///  - `year`
        /// Will be null if there is no trial.
        public let trialIntervalUnit: String?
        
        /// The interval count of the free trial. For example, a variant with `trial_interval_unit=day` and `trial_interval_quantity=14` would have a free trial that lasts 14 days.
        /// Will be `null` if there is no trial.
        public let trialIntervalQuantity: Int?
        
        /// If `category` is `pwyw`, this is the minimum price this variant can be purchased for, as a positive integer in cents.
        /// Will be `null` for all other categories.
        public let minPrice: Int?
        
        /// If `category` is `pwyw`, this is the suggested price for this variant shown at checkout, as a positive integer in cents.
        /// Will be null for all other categories.
        public let suggestedPrice: Int?
        
        /// The product's [tax category](https://docs.lemonsqueezy.com/help/products/tax-categories). One of:
        ///  - `eservice`
        ///  - `ebook`
        ///  - `saas`
        public let taxCode: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
    
    /// A list of pricing tier objects when using volume and graduated pricing. Tiers have three values:
    ///  - `last_unit` - The top limit of this tier. Will be an integer or `"inf"` (for "infinite") if this is the highest-level tier.
    ///  - `unit_price` - A positive integer in cents representing the price of each unit.
    ///  - `fixed_fee` - An optional fixed fee charged alongside the unit price.
    ///  Will be `null` for standard and package pricing.
    public struct Tiers: Codable {
        public enum LastUnit: Codable {
            case int(Int), string(String)

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let x = try? container.decode(Int.self) {
                    self = .int(x)
                } else if let x = try? container.decode(String.self) {
                    self = .string(x)
                } else {
                    throw DecodingError.typeMismatch(LastUnit.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for lastUnit"))
                }
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .int(let x):
                    try container.encode(x)
                case .string(let x):
                    try container.encode(x)
                }
            }
        }
        
        /// The top limit of this tier. Will be an integer or `"inf"` (for "infinite") if this is the highest-level tier.
        public let lastUnit: LastUnit
        
        /// A positive integer in cents representing the price of each unit.
        public let unitPrice: Int
        
        /// An optional fixed fee charged alongside the unit price.
        public let fixedFee: Int
    }
}

extension Price {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
