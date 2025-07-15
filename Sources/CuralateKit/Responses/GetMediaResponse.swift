//
// Copyright (c) 2011-2019 by Curalate, Inc.
//

import Foundation

public struct GetMediaResponse: Decodable {
    
    public let data: GetMediaResponseData
    public let metadata: GetMediaResponseMetadata
    // We repurpose this property to simplify pagination on subsequent requests, which is why it needs to be mutable.
    public var paging: GetMediaResponsePaging
    
    // Only present if the API sends an error
    public let code: String?
    public let msg: String?
    public let errorId: String?
}

public struct GetMediaResponseData: Decodable {
    public let items: [MediaItem]
    public let resultsCount: Int

    enum CodingKeys: String, CodingKey {
        case items
        case resultsCount
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        items = try container.decode([FailableDecodable<MediaItem>].self, forKey: .items).compactMap(\.base)
        resultsCount = try container.decode(Int.self, forKey: .resultsCount)
    }
}

public struct GetMediaResponseMetadata: Decodable {
    public let traceId: String
    public let requestId: String?
    public let firstPartyCuid: String?
    public let curalateUserId: String?
    public let customCuralateUserId: String?
    // TODO: add PDP metadata
}

public struct GetMediaResponsePaging: Decodable {
    // We repurpose this property to simplify pagination on subsequent requests, which is why it needs to be mutable.
    public var cursors: PagingCursor
    public let next: URL?
    public let previous: URL?
}

