//
//  LemonSqueezy+LicenseKey.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single license key by ID.
    ///
    /// - Parameters:
    ///    - licenseKeyId: The ID of the license key you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``LicenseKey``.
    public func getLicenseKey(_ licenseKeyId: LicenseKey.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<LicenseKey, LicenseKey.Included> {
        return try await call(route: .licenseKey(licenseKeyId), queryItems: queryItems)
    }
    
    /// Returns a list of license keys.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``LicenseKey``.
    public func getLicenseKeys(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[LicenseKey], LicenseKey.Included, Meta> {
        return try await call(route: .licenseKeys, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
