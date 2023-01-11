//
//  Discount.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single discount by ID.
    ///
    /// - Parameters:
    ///    - discountId: The ID of the discount you'd like to retrieve.
    /// - Returns: A response object containing the requested ``Discount``.
    public func getDiscount(_ discountId: Discount.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Discount, Discount.Included> {
        return try await call(route: .discount(discountId), queryItems: [])
    }
    
    /// Returns a list of discounts.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    /// - Returns: A response object containing an array of ``Discount``.1
    public func getDiscounts(pageNumber: Int = 1, pageSize: Int = 10) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Discount], Discount.Included, Meta> {
        return try await call(route: .discounts, queryItems: [], pageNumber: pageNumber, pageSize: pageSize)
    }
}
