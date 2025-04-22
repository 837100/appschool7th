import XCTest
@testable import Core
@testable import Network

extension Product: @retoractive Encodable {
    enum CodingKeys: String,
}
