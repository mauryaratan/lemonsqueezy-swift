//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 05/02/23.
//

import Foundation

public struct ActivateLicense: Codable {
    public let activated: Bool
    public let error: String?
    public let licenseKey: LicenseKey
    public let instance: Instance
    public let meta: Meta
    
    public struct LicenseKey: Codable {
        public let id: Int
        public let status: String
        public let key: String
        public let activationLimit: Int
        public let activationUsage: Int
        public let createdAt: String
        public let expiresAt: String?
        public let testMode: Bool?
    }
    
    public struct Instance: Codable {
        public let id: String
        public let name: String
        public let createdAt: String
    }
    
    public struct Meta: Codable {
        public let storeId: Int
        public let orderId: Int
        public let orderItemId: Int
        public let productId: Int
        public let productName: String
        public let variantId: Int
        public let variantName: String
        public let customerId: Int
        public let customerName: String
        public let customerEmail: String
    }
}

public struct ValidateLicense: Codable {
    public let valid: Bool
    public let error: String?
    public let licenseKey: LicenseKey
    public let instance: Instance?
    public let meta: Meta
    
    public struct LicenseKey: Codable {
        public let id: Int
        public let status: String
        public let key: String
        public let activationLimit: Int
        public let activationUsage: Int
        public let createdAt: String
        public let expiresAt: String?
        public let testMode: Bool?
    }
    
    public struct Instance: Codable {
        public let id: String
        public let name: String
        public let createdAt: String
    }
    
    public struct Meta: Codable {
        public let storeId: Int
        public let orderId: Int
        public let orderItemId: Int
        public let productId: Int
        public let productName: String
        public let variantId: Int
        public let variantName: String
        public let customerId: Int
        public let customerName: String
        public let customerEmail: String
    }
}

public struct DeactivateLicense: Codable {
    public let deactivated: Bool
    public let error: String?
    public let licenseKey: LicenseKey
    public let meta: Meta
    
    public struct LicenseKey: Codable {
        public let id: Int
        public let status: String
        public let key: String
        public let activationLimit: Int
        public let activationUsage: Int
        public let createdAt: String
        public let expiresAt: String?
        public let testMode: Bool?
    }
    
    public struct Meta: Codable {
        public let storeId: Int
        public let orderId: Int
        public let orderItemId: Int
        public let productId: Int
        public let productName: String
        public let variantId: Int
        public let variantName: String
        public let customerId: Int
        public let customerName: String
        public let customerEmail: String
    }
}
