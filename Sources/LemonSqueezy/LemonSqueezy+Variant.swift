//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single variant by ID.
    ///
    /// - Parameters:
    ///    - variantId: The ID of the variant you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Variant``.
    public func getVariant(_ variantId: Variant.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Variant, Variant.Included> {
        return try await call(route: .variant(variantId), queryItems: queryItems)
    }
    
    /// Returns a list of variants.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Variant``.
    public func getVariants(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Variant], Variant.Included, Meta> {
        return try await call(route: .variants, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
