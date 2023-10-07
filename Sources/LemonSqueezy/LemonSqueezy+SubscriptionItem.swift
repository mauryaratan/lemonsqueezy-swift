//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single subscription item by ID.
    ///
    /// - Parameters:
    ///    - subscriptionId: The ID of the subscription item you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``SubscriptionItem``.
    public func getSubscriptionItem(_ subscriptionItemId: SubscriptionItem.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<SubscriptionItem, SubscriptionItem.Included> {
        return try await call(route: .subscriptionItem(subscriptionItemId), queryItems: queryItems)
    }
    
    /// Returns a list of subscriptions items.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``SubscriptionItem``.
    public func getSubscriptionItems(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[SubscriptionItem], SubscriptionItem.Included, Meta> {
        return try await call(route: .subscriptionItems, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
