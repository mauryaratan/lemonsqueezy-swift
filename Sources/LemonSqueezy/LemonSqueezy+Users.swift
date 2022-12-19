import Foundation

extension LemonSqueezy {
    /// Return information about the currently-authenticated user.
    ///
    /// Equivalent to  `GET /v1/users/me`.
    ///
    /// - Returns: A response object containining the ``User``
    public func getMe() async throws -> LemonSqueezyAPIDataAndIncluded<User, User.Included> {
        return try await call(route: .me, queryItems: [])
    }
}
