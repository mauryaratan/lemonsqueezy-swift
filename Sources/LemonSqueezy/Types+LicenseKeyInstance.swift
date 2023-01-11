//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct LicenseKeyInstance: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension LicenseKeyInstance {
    public struct APIResponse: Codable {
        let data: LicenseKeyInstance
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the license key this instance belongs to.
        public let licenseKeyId: Int
        
        /// The unique identifier (UUID) for this instance. This is the `instance_id` returned when [activating a license key](https://docs.lemonsqueezy.com/help/licensing/license-api#post-v1-licenses-activate).
        public let identifier: String
        
        /// The name of the license key instance.
        public let name: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension LicenseKeyInstance {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
