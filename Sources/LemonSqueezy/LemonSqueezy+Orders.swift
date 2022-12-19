import Foundation

extension LemonSqueezy {
    
    public func getOrder(_ orderId: Order.ID) async throws -> LemonSqueezyAPIDataAndIncluded<Order, Order.Included> {
        return try await call(route: .order(orderId), queryItems: [])
    }
    
    /// Returns a list of orders.
    public func getOrders() async throws -> LemonSqueezyAPIDataIncludedAndMeta<[Order], Order.Included, Meta> {
        return try await call(route: .orders, queryItems: [])
    }
}
