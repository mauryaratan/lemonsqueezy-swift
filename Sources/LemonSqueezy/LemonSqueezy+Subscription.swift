//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single subscription by ID.
    ///
    /// - Parameters:
    ///    - subscriptionId: The ID of the subscription you'd like to retrieve.
    /// - Returns: A response object containing the requested ``Subscription``.
    public func getSubscription(_ subscriptionId: Subscription.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Subscription, Subscription.Included> {
        return try await call(route: .subscription(subscriptionId), queryItems: [])
    }
    
    public func updateSubscription(_ subscriptionId: Subscription.ID, body: [String: Any]) async throws -> LemonSqueezyAPIDataAndIncluded<Subscription, Subscription.Included> {
        let serializedBody = try JSONSerialization.data(withJSONObject: body)
        return try await call(route: .subscription(subscriptionId), method: .PATCH, queryItems: [], body: serializedBody)
    }
    
    public func cancelSubscription(_ subscriptionId: Subscription.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Subscription, Subscription.Included> {
        return try await call(route: .subscription(subscriptionId), method: .DELETE, queryItems: [])
    }
    
    /// Returns a list of subscriptions.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    /// - Returns: A response object containing an array of ``Subscription``.
    public func getSubscriptions(pageNumber: Int = 1, pageSize: Int = 10) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Subscription], Subscription.Included, Meta> {
        return try await call(route: .subscriptions, queryItems: [], pageNumber: pageNumber, pageSize: pageSize)
    }
}
