import Foundation

extension LemonSqueezy {
    /// Get a single order by ID.
    ///
    /// - Parameters:
    ///    - orderId: The ID of the order you'd like to retrieve.
    /// - Returns: A response object containing the requested ``Order``.
    public func getOrder(_ orderId: Order.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Order, Order.Included> {
        return try await call(route: .order(orderId), queryItems: [])
    }
    
    /// Returns a list of orders.
    /// - Returns: A response object containing an array of ``Order``.
    public func getOrders(pageNumber: Int = 1, pageSize: Int = 10) async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Order], Order.Included, Meta> {
        return try await call(route: .orders, queryItems: [], pageNumber: pageNumber, pageSize: pageSize)
    }
}
