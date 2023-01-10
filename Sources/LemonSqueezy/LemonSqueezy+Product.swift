//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single product by ID.
    ///
    /// - Parameters:
    ///    - productId: The ID of the product you'd like to retrieve.
    /// - Returns: A response object containing the requested ``Product``.
    public func getProduct(_ productId: Product.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Product, Product.Included> {
        return try await call(route: .product(productId), queryItems: [])
    }
    
    /// Returns a list of products.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    /// - Returns: A response object containing an array of ``Product``.
    public func getProducts(pageNumber: Int = 1, pageSize: Int = 10) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Product], Product.Included, Meta> {
        return try await call(route: .products, queryItems: [], pageNumber: pageNumber, pageSize: pageSize)
    }
}
