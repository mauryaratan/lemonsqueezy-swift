//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 08/10/23.
//

import Foundation

extension LemonSqueezy {
    /// Get a single Webhook by ID.
    ///
    /// - Parameters:
    ///    - webhookId: The ID of the Webhook you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Webhook``.
    public func getWebhook(_ webhookId: Webhook.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Webhook, Webhook.Included> {
        return try await call(route: .webhook(webhookId), queryItems: queryItems)
    }
    
    /// Returns a list of Webhooks.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Webhook``.
    public func getWebhooks(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Webhook], Webhook.Included, Meta> {
        return try await call(route: .webhooks, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
