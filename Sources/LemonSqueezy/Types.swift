import Foundation

internal protocol Fielded {
    associatedtype Field: PartialKeyPath<Self>
    static func fieldName(field: Field) -> String?
    static var fieldParameterName: String { get }
}
