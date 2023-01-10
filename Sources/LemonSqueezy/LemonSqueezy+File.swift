//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single file by ID.
    ///
    /// - Parameters:
    ///    - fileId: The ID of the file you'd like to retrieve.
    /// - Returns: A response object containing the requested ``File``.
    public func getFile(_ fileId: File.ID) async throws -> LemonSqueezyAPIDataAndIncluded<File, File.Included> {
        return try await call(route: .file(fileId), queryItems: [])
    }
    
    /// Returns a list of files.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    /// - Returns: A response object containing an array of ``File``.
    public func getFiles(pageNumber: Int = 1, pageSize: Int = 10) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[File], File.Included, Meta> {
        return try await call(route: .files, queryItems: [], pageNumber: pageNumber, pageSize: pageSize)
    }
}
