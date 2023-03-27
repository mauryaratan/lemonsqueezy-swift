//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 28/03/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single customer by ID.
    ///
    /// - Parameters:
    ///    - customerId: The ID of the customer you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Customer``.
    public func getCustomer(_ customerId: Customer.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Customer, Customer.Included> {
        return try await call(route: .customer(customerId), queryItems: queryItems)
    }
    
    /// Returns a list of customers.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Customer``.
    public func getCustomers(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Customer], Customer.Included, Meta> {
        return try await call(route: .customers, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
