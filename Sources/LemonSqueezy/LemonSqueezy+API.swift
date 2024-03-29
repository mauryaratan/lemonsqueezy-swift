import Foundation

extension LemonSqueezy {
    internal func call<T: Codable>(
        route: APIRoute,
        method: HTTPMethod = .GET,
        queryItems: [URLQueryItem] = [],
        pageNumber: Int? = nil,
        pageSize: Int = 10,
        body: Data? = nil
    ) async throws -> T {
        let url = getURL(for: route, queryItems: queryItems, pageNumber: pageNumber, pageSize: pageSize)
        var request = URLRequest(url: url)
        if let body {
            request.httpBody = body
        }

        signURLRequest(method: method, body: body, request: &request)

        let (data, _) = try await URLSession.shared.data(for: request)
        return try decodeOrThrow(decodingType: T.self, data: data)
    }
}

extension LemonSqueezy {
    internal func getURL(for route: APIRoute, queryItems: [URLQueryItem] = [], pageNumber: Int?, pageSize: Int) -> URL {
        var combinedQueryItems: [URLQueryItem] = []

        if (pageNumber != nil) {
            combinedQueryItems.append(URLQueryItem(name: "page[size]", value: String(pageSize)))
            combinedQueryItems.append(URLQueryItem(name: "page[number]", value: String(pageNumber!)))
        }

        combinedQueryItems.append(contentsOf: queryItems)

        if let routeQueryItems = route.resolvedPath.queryItems {
            combinedQueryItems.append(contentsOf: routeQueryItems)
        }

        var components = URLComponents()
        components.scheme = "https"
        components.host = self.baseHost
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
  case GET, POST, DELETE, PUT, PATCH
}

extension LemonSqueezy {
    internal enum APIRoute {
        case me

        case orders
        case order(_ orderId: Order.ID)

        case stores
        case store(_ storeId: Store.ID)

        case products
        case product(_ productId: Product.ID)

        case variants
        case variant(_ variantId: Variant.ID)

        case files
        case file(_ fileId: File.ID)

        case orderItems
        case orderItem(_ orderItemId: OrderItem.ID)

        case subscriptions
        case subscription(_ subscriptionId: Subscription.ID)

        case subscriptionInvoices
        case subscriptionInvoice(_ subscriptionInvoiceId: SubscriptionInvoice.ID)

        case subscriptionItems
        case subscriptionItem(_ subscriptionItemId: SubscriptionItem.ID)
        case subscriptionItemCurrentUsage(_ subscriptionItemId: SubscriptionItem.ID)

        case discounts
        case discount(_ discountId: Discount.ID)

        case discountRedemptions
        case discountRedemption(_ discountRedemptionId: DiscountRedemption.ID)

        case licenseKeys
        case licenseKey(_ licenseKeyId: LicenseKey.ID)

        case licenseKeyInstances
        case licenseKeyInstance(_ licenseKeyInstanceId: LicenseKeyInstance.ID)

        case checkouts
        case checkout(_ checkoutId: Checkout.ID)

        case activateLicense
        case validateLicense
        case deactivateLicense

        case customers
        case customer(_ customerId: Customer.ID)
        
        case prices
        case price(_ priceId: Price.ID)
        
        case usageRecords
        case usageRecord(_ usageRecordId: UsageRecord.ID)
        
        case webhooks
        case webhook(_ webhookId: Webhook.ID)

        var resolvedPath: (path: String, queryItems: [URLQueryItem]?) {
            switch self {
            case .me:
                return (path: "/v1/users/me", queryItems: nil)
            case .order(let id):
              return (path: "/v1/orders/\(id)", queryItems: nil)
            case .orders:
              return (path: "/v1/orders", queryItems: nil)
            case .stores:
              return (path: "/v1/stores", queryItems: nil)
            case .store(let id):
              return (path: "/v1/stores/\(id)", queryItems: nil)
            case .products:
                return (path: "/v1/products", queryItems: nil)
            case .product(let id):
                return (path: "/v1/products/\(id)", queryItems: nil)
            case .variants:
                return (path: "/v1/variants", queryItems: nil)
            case .variant(let id):
                return (path: "/v1/variants/\(id)", queryItems: nil)
            case .files:
                return (path: "/v1/files", queryItems: nil)
            case .file(let id):
                return (path: "/v1/files/\(id)", queryItems: nil)
            case .orderItems:
                return (path: "/v1/order-items", queryItems: nil)
            case .orderItem(let id):
                return (path: "/v1/order-items/\(id)", queryItems: nil)
            case .subscriptions:
                return (path: "/v1/subscriptions", queryItems: nil)
            case .subscription(let id):
                return (path: "/v1/subscriptions/\(id)", queryItems: nil)
            case .subscriptionInvoices:
                return (path: "/v1/subscription-invoices", queryItems: nil)
            case .subscriptionInvoice(let id):
                return (path: "/v1/subscription-invoices/\(id)", queryItems: nil)
            case .subscriptionItems:
                return (path: "/v1/subscription-items", queryItems: nil)
            case .subscriptionItem(let id):
                return (path: "/v1/subscription-items/\(id)", queryItems: nil)
            case .subscriptionItemCurrentUsage(let id):
                return (path: "/v1/subscription-items/\(id)/current-usage", queryItems: nil)
            case .discounts:
                return (path: "/v1/discounts", queryItems: nil)
            case .discount(let id):
                return (path: "/v1/discounts/\(id)", queryItems: nil)
            case .discountRedemptions:
                return (path: "/v1/discount-redemptions", queryItems: nil)
            case .discountRedemption(let id):
                return (path: "/v1/discount-redemptions/\(id)", queryItems: nil)
            case .licenseKeys:
                return (path: "/v1/license-keys", queryItems: nil)
            case .licenseKey(let id):
                return (path: "/v1/license-keys/\(id)", queryItems: nil)
            case .licenseKeyInstances:
                return (path: "/v1/license-key-instances", queryItems: nil)
            case .licenseKeyInstance(let id):
                return (path: "/v1/license-key-instances/\(id)", queryItems: nil)
            case .checkouts:
                return (path: "/v1/checkouts", queryItems: nil)
            case .checkout(let id):
                return (path: "/v1/checkouts/\(id)", queryItems: nil)
            case .activateLicense:
                return (path: "/v1/licenses/activate", queryItems: nil)
            case .validateLicense:
                return (path: "/v1/licenses/validate", queryItems: nil)
            case .deactivateLicense:
                return (path: "/v1/licenses/deactivate", queryItems: nil)
            case .customers:
                return (path: "/v1/customers", queryItems: nil)
            case .customer(let id):
                return (path: "/v1/customers/\(id)", queryItems: nil)
            case .prices:
                return (path: "/v1/prices", queryItems: nil)
            case .price(let id):
                return (path: "/v1/prices/\(id)", queryItems: nil)
            case .usageRecords:
                return (path: "/v1/usage-records", queryItems: nil)
            case .usageRecord(let id):
                return (path: "/v1/usage-records/\(id)", queryItems: nil)
            case .webhooks:
                return (path: "/v1/webhooks", queryItems: nil)
            case .webhook(let id):
                return (path: "/v1/webhooks/\(id)", queryItems: nil)
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

    /// Related resources that can be included in the same response by using the `include` query parameter.
    public let included: [IncludedResource]?

    /// Any errors associated with the request
    public let errors: [LemonSqueezyAPIError]?
}

public struct LemonSqueezyAPIDataIncludedAndMeta<Resource: Codable, Included: Codable, Meta: Codable>: Codable {
    /// The requested object(s)
    public let data: Resource

    /// An object containing pagination information for paginated requests
    public let meta: Meta?

    /// Related resources that can be included in the same response by using the `include` query parameter.
    public let included: [IncludedResource]?

    /// Any errors associated with the request
    public let errors: [LemonSqueezyAPIError]?
}

public struct LemonSqueezyAPIMeta<Meta: Codable>: Codable {
    public let meta: Meta

    /// Any errors associated with the request
    public let errors: [LemonSqueezyAPIError]?
}

public struct IncludedResource: Codable, Identifiable {
    public typealias ID = String
    
    public let id: ID
    public let type: String
    public let attributes: Codable
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = (try? values.decode(ID.self, forKey: .id)) ?? ""
        type = (try? values.decode(String.self, forKey: .type)) ?? ""
        
        if let resource = try? Store(from: decoder) {
            attributes = resource
        } else if let resource = try? Order(from: decoder) {
            attributes = resource
        } else if let resource = try? OrderItem(from: decoder) {
            attributes = resource
        } else if let resource = try? Product(from: decoder) {
            attributes = resource
        } else if let resource = try? Customer(from: decoder) {
            attributes = resource
        } else if let resource = try? Subscription(from: decoder) {
            attributes = resource
        } else if let resource = try? SubscriptionItem(from: decoder) {
            attributes = resource
        } else if let resource = try? LicenseKey(from: decoder) {
            attributes = resource
        } else if let resource = try? LicenseKeyInstance(from: decoder) {
            attributes = resource
        } else if let resource = try? Discount(from: decoder) {
            attributes = resource
        } else if let resource = try? DiscountRedemption(from: decoder) {
            attributes = resource
        } else if let resource = try? File(from: decoder) {
            attributes = resource
        } else if let resource = try? Variant(from: decoder) {
            attributes = resource
        } else if let resource = try? Webhook(from: decoder) {
            attributes = resource
        } else if let resource = try? UsageRecord(from: decoder) {
            attributes = resource
        } else {
            throw DecodingError.dataCorrupted(
                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Unable to decode resource.")
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let resource = attributes as? Store {
            try container.encode(resource)
        } else if let resource = attributes as? Order {
            try container.encode(resource)
        } else if let resource = attributes as? OrderItem {
            try container.encode(resource)
        } else if let resource = attributes as? Product {
            try container.encode(resource)
        } else if let resource = attributes as? Customer {
            try container.encode(resource)
        } else if let resource = attributes as? Subscription {
            try container.encode(resource)
        } else if let resource = attributes as? SubscriptionItem {
            try container.encode(resource)
        } else if let resource = attributes as? LicenseKey {
            try container.encode(resource)
        } else if let resource = attributes as? LicenseKeyInstance {
            try container.encode(resource)
        } else if let resource = attributes as? Discount {
            try container.encode(resource)
        } else if let resource = attributes as? DiscountRedemption {
            try container.encode(resource)
        } else if let resource = attributes as? File {
            try container.encode(resource)
        } else if let resource = attributes as? Variant {
            try container.encode(resource)
        } else if let resource = attributes as? Webhook {
            try container.encode(resource)
        } else if let resource = attributes as? UsageRecord {
            try container.encode(resource)
        } else {
            throw EncodingError.invalidValue(
                attributes,
                EncodingError.Context(codingPath: encoder.codingPath,
                                      debugDescription: "Unable to encode resource.")
            )
        }
    }
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
