//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 28/03/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single discount redemption by ID.
    ///
    /// - Parameters:
    ///    - discountId: The ID of the discount you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``DiscountRedemption``.
    public func getDiscountRedemption(_ discountRedemptionId: DiscountRedemption.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<DiscountRedemption, DiscountRedemption.Included> {
        return try await call(route: .discountRedemption(discountRedemptionId), queryItems: queryItems)
    }
    
    /// Returns a list of discounts redemptions.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``DiscountRedemption``.
    public func getDiscountRedemptions(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[DiscountRedemption], DiscountRedemption.Included, Meta> {
        return try await call(route: .discountRedemptions, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
