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
    /// The summary of the encountered error
    public let title: String
    
    /// The details for the encountered error
    public let detail: String
    
    public let errors: [ErrorDetail]?
}

public struct ErrorDetail: Codable, Hashable {
  public let message: String?
}

extension LemonSqueezyAPIError: LocalizedError {
  /// The human-readable description for the error
  public var errorDescription: String? {
    """
Error: \(title)
Details: \(detail)
"""
  }
}
