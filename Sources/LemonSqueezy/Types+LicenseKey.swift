//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct LicenseKey: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension LicenseKey {
    public struct APIResponse: Codable {
        let data: LicenseKey
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this license key belongs to.
        public let storeId: Int

        /// The ID of the order associated with this license key.
        public let orderId: Int

        /// The ID of the order item associated with this license key.
        public let orderItemId: Int

        /// The ID of the product associated with this license key.
        public let productId: Int

        /// The full name of the customer.
        public let userName: String

        /// The email address of the customer.
        public let userEmail: String

        /// A “short” representation of the license key, made up of the string “XXXX-” followed by the last 12 characters of the license key.
        public let keyShort: String

        /// The activation limit of this license key.
        public let activationLimit: Int

        /// A count of the number of instances this license key has been activated on.
        public let instancesCount: Int

        /// Has the value `true` if this license key has been disabled.
        public let disabled: Int

        /// The status of the license key. One of `inactive`, `active`, `expired`, `disabled`.
        public let status: String

        /// The formatted status of the license key.
        public let statusFormatted: String

        /// An ISO-8601 formatted date-time string indicating when the license key expires. Can be `null` if the license key is perpetual.
        public let expiresAt: String?

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
        
        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
    }
}

extension LicenseKey {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
