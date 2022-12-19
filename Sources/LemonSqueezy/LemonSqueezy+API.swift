import Foundation

extension LemonSqueezy {
    internal func call<T: Codable>(
        route: APIRoute,
        method: HTTPMethod = .GET,
        queryItems: [URLQueryItem] = [],
        body: Data? = nil
    ) async throws -> T {
        let url = getURL(for: route, queryItems: queryItems)
        var request = URLRequest(url: url)
        if let body {
            request.httpBody = body
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        signURLRequest(method: method, body: body, request: &request)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return try decodeOrThrow(decodingType: T.self, data: data)
    }
}

extension LemonSqueezy {
    internal func getURL(for route: APIRoute, queryItems: [URLQueryItem] = []) -> URL {
        var combinedQueryItems: [URLQueryItem] = []
        
        combinedQueryItems.append(contentsOf: queryItems)
        
        if let routeQueryItems = route.resolvedPath.queryItems {
            combinedQueryItems.append(contentsOf: routeQueryItems)
        }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.lemonsqueezy.test"
        components.path = "\(route.resolvedPath.path)"
        components.queryItems = combinedQueryItems
        
        var allowedCharacters = CharacterSet.urlQueryAllowed
        allowedCharacters.remove(charactersIn: ":()")
        components.percentEncodedQuery = components.query?.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
        
        return components.url!
    }
    
    internal func signURLRequest(method: HTTPMethod, body: Data? = nil, request: inout URLRequest) {
        request.addValue("Bearer \(self.apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        request.httpMethod = method.rawValue
    }
}

internal enum HTTPMethod: String {
  case GET, POST, DELETE, PUT
}

extension LemonSqueezy {
    internal enum APIRoute {
        case me
        
        case orders
        case order(_ orderId: Order.ID)
        
        var resolvedPath: (path: String, queryItems: [URLQueryItem]?) {
            switch self {
            case .me:
                return (path: "/v1/users/me", queryItems: nil)
            case .order(let id):
              return (path: "/v1/orders/\(id)", queryItems: nil)
            case .orders:
              return (path: "/v1/orders", queryItems: nil)
            }
        }
    }
    
    internal func decodeOrThrow<T: Codable>(decodingType: T.Type, data: Data) throws -> T {
        guard let result = try? decoder.decode(decodingType.self, from: data) else {
            if let error = try? decoder.decode(LemonSqueezyAPIError.self, from: data) { throw error }
            
            throw LemonSqueezyError.UnknownError(String(data: data, encoding: .utf8))
        }
        
        return result
    }
}

public struct LemonSqueezyAPIDataAndIncluded<Resource: Codable, Included: Codable>: Codable {
    /// The requested object(s)
    public let data: Resource
    
    /// Related resources that can be included in the same response by usnig the `include` query parameter.
    public let included: Included?
    
    /// Any errors associated with the request
    public let errors: [LemonSqueezyAPIError]?
}

public struct LemonSqueezyAPIDataIncludedAndMeta<Resource: Codable, Included: Codable, Meta: Codable>: Codable {
    /// The requested object(s)
    public let data: Resource
    
    /// An object containing pagination information for paginated requests
    public let meta: Meta?
    
    /// Related resources that can be included in the same response by usnig the `include` query parameter.
    public let included: Included?
    
    /// Any errors associated with the request
    public let errors: [LemonSqueezyAPIError]?
}

/// An object containing pagination information for paginated requests
public struct Meta: Codable {
    public let page: Page
    
    public struct Page: Codable {
        public let currentPage: Int
        public let from: Int
        public let lastPage: Int
        public let perPage: Int
        public let to: Int
        public let total: Int
    }
}
