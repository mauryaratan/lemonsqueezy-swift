import Foundation
import Combine

@MainActor
public class LemonSqueezy: NSObject, ObservableObject {
    public private(set) var apiKey: String
    
    internal let decoder: JSONDecoder
    internal let encoder: JSONEncoder

    public init(_ apiKey: String) {
        self.decoder = Self.initializeDecoder()
        self.encoder = Self.initializeEncoder()
        self.apiKey = apiKey
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
