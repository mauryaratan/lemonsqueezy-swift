//
//  File.swift
//
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

public struct SubscriptionItem: Codable, Identifiable {
    public typealias ID = String

    /// The unique identifier of this user.
    public let id: ID

    /// The type of the resource.
    public let type: String

    /// An object representing the resource data.
    public let attributes: Attributes
}


extension SubscriptionItem {
    public struct APIResponse: Codable {
        let data: SubscriptionItem
    }

    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the Subscription associated with this subscription item.
        public let subscriptionId: Int

        /// The ID of the Price associated with this subscription item.
        public let priceId: Int

        /// A positive integer representing the unit quantity of this subscription item.
        /// Will be `0` if the related susbcription product/variant has usage-based billing enabled.
        public let quantity: Int

        /// A boolean value indicating whether the related susbcription product/variant has usage-based billing enabled.
        public let isUsageBased: Bool

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension SubscriptionItem {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {

    }

    /// Returns a meta object containing usage information.
    public struct Meta: Codable {
        /// An ISO 8601 formatted date-time string indicating the start of the billing period.
        public let periodStart: String

        /// An ISO 8601 formatted date-time string indicating the end of the billing period.
        public let periodEnd: String

        /// A positive integer representing the usage total.
        public let quantity: Int

        /// The interval unit of the subscription's variant. One of: `day`, `week`, `month`, `year`
        public let intervalUnit: String

        /// The interval count of the subscription's variant.
        /// For example, a subscription item with `interval_unit=month` and `interval_quantity=3` would mean the subscription renews every a three months.
        public let intervalQuantity: Int
    }
}

