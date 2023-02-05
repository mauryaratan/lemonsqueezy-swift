import Foundation

extension LemonSqueezy {
    /// Returns a list of stores.
    ///
    /// Equivalent to `GET /v1/stores`
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Store``.
    public func getStores(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Store], Store.Included, Meta> {
        return try await call(route: .stores, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }

    /// Return a single store.
    /// Equivalent to `GET /v1/stores/:id`
    /// - Parameters:
    ///   - storeId: The ID of the store to retrieve.
    ///   - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Store``.
    public func getStore(_ storeId: Store.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Store, Store.Included> {
        return try await call(route: .store(storeId), queryItems: queryItems)
    }
}
