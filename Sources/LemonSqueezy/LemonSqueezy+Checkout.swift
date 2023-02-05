//
//  LemonSqueezy+Checkout.swift
//
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single checkout by ID.
    ///
    /// - Parameters:
    ///    - checkoutId: The ID of the checkout you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Checkout``.
    public func getCheckout(_ checkoutId: Checkout.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Checkout, Checkout.Included> {
        return try await call(route: .checkout(checkoutId), queryItems: queryItems)
    }
    
    /// Create a checkout.
    ///
    /// - Parameters:
    ///    - body: Checkout [object](https://docs.lemonsqueezy.com/api/checkouts#create-a-checkout).
    /// - Returns: A response object containing the requested ``Checkout``.
    public func createCheckout(body: [String: Any]) async throws -> LemonSqueezyAPIDataAndIncluded<Checkout, Checkout.Included> {
        let serializedBody = try JSONSerialization.data(withJSONObject: body)
        return try await call(route: .checkouts, method: .POST, queryItems: [], body: serializedBody)
    }
    
    /// Returns a list of checkouts.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Checkout``.1
    public func getCheckouts(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Checkout], Checkout.Included, Meta> {
        return try await call(route: .checkouts, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
