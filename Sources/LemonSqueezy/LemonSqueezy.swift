import Foundation
import Combine

@MainActor
public class LemonSqueezy: NSObject, ObservableObject {
    public private(set) var apiKey: String
    
    /// Base URL to API endpoint, without https prefix.
    public private(set) var baseHost: String
    
    internal let decoder: JSONDecoder
    internal let encoder: JSONEncoder

    public init(_ apiKey: String, _ baseHost: String = "") {
        self.decoder = Self.initializeDecoder()
        self.encoder = Self.initializeEncoder()
        self.apiKey = apiKey
        
        self.baseHost = baseHost.isEmpty ? "api.lemonsqueezy.com" : baseHost
    }
    
    static internal func initializeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return decoder
    }
    
    static internal func initializeEncoder() -> JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        
        return encoder
    }
}
