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
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Product``.
    public func getProduct(_ productId: Product.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Product, Product.Included> {
        return try await call(route: .product(productId), queryItems: queryItems)
    }
    
    /// Returns a list of products.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Product``.
    public func getProducts(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Product], Product.Included, Meta> {
        return try await call(route: .products, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
