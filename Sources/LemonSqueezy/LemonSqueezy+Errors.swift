import Foundation

/// The error types relating to Twift instances and methods.
public enum LemonSqueezyError: Error {
    /// This error is thrown only when no other error type adequately matches encountered problem.
    case UnknownError(_ context: Any? = nil)
}

extension LemonSqueezyError: LocalizedError {
    /// The human-readable description for the error.
    public var errorDescription: String? {
        switch self {
        case .UnknownError(let details):
            if let details {
                return "Unknown Error: \(details)"
            }
            return "Unknown Error: \(details.debugDescription)"
        }
    }
}

/// An error returned from Lemon Squeezy API
public struct LemonSqueezyAPIError: Codable, Hashable {
    public let errors: [ErrorDetail]?
    public let error: String?
}

public struct ErrorDetail: Codable, Hashable {
    /// The summary of the encountered error
    public let title: String
    
    /// The details for the encountered error
    public let detail: String
    
    public let status: String
    
    public var message: String { title }
}

extension LemonSqueezyAPIError: LocalizedError {
  /// The human-readable description for the error
    public var errorDescription: String? {
        """
Error: \(errors?.first?.title ?? "Unknown")
Detail: \(errors?.first?.detail ?? "Unknown")
Status: \(errors?.first?.status ?? "Unknown")
"""
    }
}
