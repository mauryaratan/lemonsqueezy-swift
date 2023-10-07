//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 07/10/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single usage record by ID.
    ///
    /// - Parameters:
    ///    - usageRecordId: The ID of the usage record you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``UsageRecord``.
    public func getUsageRecord(_ usageRecordId: UsageRecord.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<UsageRecord, UsageRecord.Included> {
        return try await call(route: .usageRecord(usageRecordId), queryItems: queryItems)
    }
    
    /// Returns a list of usage records.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``UsageRecord``.
    public func getUsageRecords(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[UsageRecord], UsageRecord.Included, Meta> {
        return try await call(route: .usageRecords, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
