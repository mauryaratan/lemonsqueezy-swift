//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single price by ID.
    ///
    /// - Parameters:
    ///    - priceId: The ID of the price you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Price``.
    public func getPrice(_ priceId: Price.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Price, Price.Included> {
        return try await call(route: .price(priceId), queryItems: queryItems)
    }
    
    /// Returns a list of prices.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Price``.
    public func getPrices(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Price], Price.Included, Meta> {
        return try await call(route: .prices, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
