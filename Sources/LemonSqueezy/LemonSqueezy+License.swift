//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 05/02/23.
//

import Foundation

extension LemonSqueezy {
    public func activateLicense(queryItems: [URLQueryItem]) async throws -> ActivateLicense {
        return try await call(route: .activateLicense, method: .POST, queryItems: queryItems)
    }
    
    public func validateLicense(queryItems: [URLQueryItem]) async throws -> ValidateLicense {
        return try await call(route: .validateLicense, method: .POST, queryItems: queryItems)
    }
    
    public func deactivateLicense(queryItems: [URLQueryItem]) async throws -> DeactivateLicense {
        return try await call(route: .deactivateLicense, method: .POST, queryItems: queryItems)
    }
}
