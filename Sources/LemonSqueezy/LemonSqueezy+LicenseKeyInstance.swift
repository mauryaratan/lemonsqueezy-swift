//
//  LemonSqueezy+LicenseKeyInstance.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single license key instance by ID.
    ///
    /// - Parameters:
    ///    - licenseKeyInstanceId: The ID of the license key you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``LicenseKeyInstance``.
    public func getLicenseKeyInstance(_ licenseKeyInstanceId: LicenseKeyInstance.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<LicenseKeyInstance, LicenseKeyInstance.Included> {
        return try await call(route: .licenseKeyInstance(licenseKeyInstanceId), queryItems: queryItems)
    }
    
    /// Returns a list of license key instances.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``LicenseKeyInstance``.
    public func getLicenseKeyInstances(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[LicenseKeyInstance], LicenseKeyInstance.Included, Meta> {
        return try await call(route: .licenseKeyInstances, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
