//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 05/02/23.
//

import Foundation

extension LemonSqueezy {
    public func activateLicense(licenseKey: String, instanceName: String) async throws -> ActivateLicense {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "license_key", value: licenseKey),
            URLQueryItem(name: "instance_name", value: instanceName)
        ]
        
        return try await call(route: .activateLicense, method: .POST, queryItems: queryItems)
    }
    
    public func validateLicense(licenseKey: String, instanceId: String?) async throws -> ValidateLicense {
        var queryItems: [URLQueryItem] = []
        
        queryItems.append(URLQueryItem(name: "license_key", value: licenseKey))
        
        if instanceId != nil {
            queryItems.append(URLQueryItem(name: "instance_id", value: instanceId))
        }
        
        return try await call(route: .validateLicense, method: .POST, queryItems: queryItems)
    }
    
    public func deactivateLicense(licenseKey: String, instanceId: String) async throws -> DeactivateLicense {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "license_key", value: licenseKey),
            URLQueryItem(name: "instance_id", value: instanceId)
        ]
        
        return try await call(route: .deactivateLicense, method: .POST, queryItems: queryItems)
    }
}
