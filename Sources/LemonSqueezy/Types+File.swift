//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct File: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension File {
    public struct APIResponse: Codable {
        let data: File
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the variant this file belongs to.
        public let variantId: Int

        /// The unique identifier (UUID) for this file.
        public let identifier: String

        /// The name of the file (e.g. `example.pdf`).
        public let name: String

        /// The file extension of the file (e.g. `pdf`).
        public let `extension`: String

        /// The unique URL to download the file. Note: for security reasons, download URLs are signed, expire after 1 hour and are rate-limited to 10 downloads per day per IP address.
        public let downloadUrl: String

        /// A positive integer in bytes representing the size of the file.
        public let size: Int

        /// The human-readable size of the file (e.g. `5.5 MB`).
        public let sizeFormatted: String

        /// The software version of this file (if one exists, e.g. 1.0.0).
        public let version: String?

        /// An integer representing the order of this file when displayed.
        public let sort: Int

        /// The status of the file. Either `draft` or `published`.
        public let status: String

        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension File {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
