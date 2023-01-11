//
//  File.swift
//  
//
//  Created by Ram Ratan Maurya on 11/01/23.
//

import Foundation

public struct Checkout: Codable, Identifiable {
    public typealias ID = String
    
    /// The unique identifier of this user.
    public let id: ID
    
    /// The type of the resource.
    public let type: String
    
    /// An object representing the resource data.
    public let attributes: Attributes
}

extension Checkout {
    public struct APIResponse: Codable {
        let data: Checkout
    }
    
    /// An object representing the resources data.
    public struct Attributes: Codable {
        /// The ID of the store this checkout belongs to.
        public let storeId: Int
        
        /// The ID of the variant associated with this checkout.
        public let variantId: Int
        
        /// If the value is not `null`, this represents a positive integer in cents representing the custom price of the variant.
        public let customPrice: Int?
        
        /// An object containing any overridden product options for this
        public let productOptions: ProductOptions

        /// An object containing checkout options for this checkout.
        public let checkoutOptions: CheckoutOptions

        /// An object containing any prefill or custom data to be used in the checkout.
        public let checkoutData: CheckoutData
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the checkout expires. Can be null if the checkout is perpetual.
        public let expiresAt: String?
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was created.
        public let createdAt: String
        
        /// An [ISO-8601](https://en.wikipedia.org/wiki/ISO_8601) formatted date-time string indicating when the object was last updated.
        public let updatedAt: String
        
        /// A boolean indicating if the returned subscription object was created within test mode.
        public let testMode: Bool
        
        /// The unique URL to access the checkout. Note: for security reasons, download URLs are signed. If the checkout `expiresAt` is set, the URL will expire after the specified time.
        public let url: String
    }
    
    public struct ProductOptions: Codable {
        /// A custom name for the product
        public let name: String?
        
        /// A custom description for the product
        public let description: String?
        
        /// An array of image URLs to use as the product's media
        public let media: [String]?
        
        /// A custom URL to redirect to after a successful purchase
        public let redirectUrl: String?
        
        /// A custom text to use for the order receipt email button
        public let receiptButtonText: String?
        
        /// A custom URL to use for the order receipt email button
        public let receiptLinkUrl: String?
        
        /// A custom thank you note to use for the order receipt email
        public let receiptThankYouNote: String?
        
        /// An array of variant IDs to enable for this checkout. If this is empty, all variants will be enabled.
        public let enabledVariants: [Int]?
    }
    
    public struct CheckoutOptions: Codable {
        /// If true, show the checkout overlay
        public let embed: Bool
        
        /// If false, hide the product media
        public let media: Bool
        
        /// If false, hide the store logo
        public let logo: Bool
        
        /// If false, hide the product description
        public let desc: Bool
        
        /// If false, hide the discount code field
        public let discount: Bool
        
        /// If true, use the dark theme
        public let dark: Bool
        
        /// If false, hide the "You will be charged..." subscription preview text
        public let subscriptionPreview: Bool
        
        /// A custom hex color to use for the checkout button
        public let buttonColor: String
    }
    
    public struct CheckoutData: Codable {
        /// A pre-filled email address
        public let email: String?
        
        /// A pre-filled name
        public let name: String?
        
        /// Billing address
        public let billngAddress: BillingAddress?
        
        /// A pre-filled billing address zip/postal code
        public let taxNumber: String?
        
        /// A pre-filled discount code
        public let discountCode: String?
        
        /// An object containing any custom data to be passed to the checkout
        public let custom: [String?: String?]?
        
        public struct BillingAddress: Codable {
            /// A pre-filled billing address country in a ISO 3166-1 alpha-2 format
            public let country: String?
            
            /// A pre-filled billing address zip/postal code
            public let zip: String?
        }
    }
}

extension Checkout {
    /// Related resources that can be included in the same response by using the `include` query parameter.
    public struct Included: Codable {
        
    }
}
