//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 08/10/23.
//

import Foundation

/// Webhooks are used to send event data to an external system (i.e. your application). Using the API, you can set up webhooks and subscribe to events programatically.
public struct Webhook: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this Webhook.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Webhook {
    public struct APIResponse: Codable {
        let data: Webhook
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this webhook belongs to.
        public let storeId: Int
        
        /// The URL that events will be sent to.
        public let url: String
        
        /// An array of events that will be sent.
        public let events: [String]
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the last webhook event was sent. Will be null if no events have been sent yet.
        public let lastSentAt: String?
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
        
        /// A boolean indicating if the object was created within test mode.
        public let testMode: Bool
    }
}

extension Webhook {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
