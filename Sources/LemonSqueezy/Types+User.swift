import Foundation

public struct User: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension User {
    public struct APIResponse: Codable {
        let data: User
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The name of the user.
        public let name: String
        
        /// The email address of the user.
        public let email: String
        
        /// A randomly generated hex color code for the user. We use this internally as the background color of an avatar if the user has not uploaded a custom avatar.
        public let color: String
        
        /// A URL to the avatar image for this user. If the user has not uploaded a custom avatar, this will point to their Gravatar URL.
        public let avatarUrl: String
        
        /// Has the value `true` if the user has uploaded a custom avatar image.
        public let hasCustomAvatar: Bool
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
    }
}

extension User {
    /// Related resources that can be included in the same response by usnig the `include` query parameter.
    public struct Included: Codable {
        
    }
}
