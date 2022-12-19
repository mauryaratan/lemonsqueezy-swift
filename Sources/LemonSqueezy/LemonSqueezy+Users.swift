import Foundation

extension LemonSqueezy {
    public func getMe() async throws -> LemonSqueezyAPIDataAndIncluded<User, User.Included> {
        return try await call(route: .me, queryItems: [])
    }
}
