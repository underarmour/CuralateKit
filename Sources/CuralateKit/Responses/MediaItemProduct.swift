//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct MediaItemProduct: Decodable {
    public let id: String
    public let name: String
    public let images: [NetworkPhoto]
    public let link: URL
    public let price: Price?
    public let metadata: [String : String]?
    public let spatialTag: SpatialTag?
}

public struct SpatialTag: Decodable {
    public let x: Float
    public let y: Float
    public let label: String
}

public struct Price: Decodable {
    public let display: String
    public let value: Decimal?
    public let currencySymbol: String?
    public let currencyCode: String?
    public let saleValue: Decimal?
    public let saleDisplay: String?
    public let isOnSale: Bool?
}
