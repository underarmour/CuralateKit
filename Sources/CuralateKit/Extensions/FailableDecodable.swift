//  FailableDecodable.swift

import Foundation

struct FailableDecodable<Base: Decodable>: Decodable {
    public let base: Base?

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        base = try? container.decode(Base.self)
    }
}
