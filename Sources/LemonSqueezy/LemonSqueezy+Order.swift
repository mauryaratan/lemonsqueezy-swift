import Foundation

extension LemonSqueezy {
    /// Get a single order by ID.
    ///
    /// - Parameters:
    ///    - orderId: The ID of the order you'd like to retrieve.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing the requested ``Order``.
    public func getOrder(_ orderId: Order.ID, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataAndIncluded<Order, Order.Included> {
        return try await call(route: .order(orderId), queryItems: queryItems)
    }
    
    /// Returns a list of orders.
    /// - Parameters:
    ///    - pageNumber: The page number to return the response for.
    ///    - pageSize: The number of resources to return per-page.
    ///    - queryItems: An array of `URLQueryItem`, passed as query parameters.
    /// - Returns: A response object containing an array of ``Order``.
    public func getOrders(pageNumber: Int = 1, pageSize: Int = 10, queryItems: [URLQueryItem] = []) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Order], Order.Included, Meta> {
        return try await call(route: .orders, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
    }
}
