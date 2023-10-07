//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single subscription invoice by ID.
    ///
    /// - Parameters:
    ///    - subscriptionId: The ID of the subscription you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``SubscriptionInvoice``.
    public func getSubscriptionInvoice(_ subscriptionInvoiceId: SubscriptionInvoice.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<SubscriptionInvoice, SubscriptionInvoice.Included> {
        return try await call(route: .subscriptionInvoice(subscriptionInvoiceId), queryItems: queryItems)
    }
    
    /// Returns a list of subscriptions invoices.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Subscription``.
    public func getSubscriptionInvoices(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[SubscriptionInvoice], SubscriptionInvoice.Included, Meta> {
        return try await call(route: .subscriptionInvoices, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
