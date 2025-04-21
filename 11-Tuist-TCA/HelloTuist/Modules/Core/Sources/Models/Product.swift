import Foundation

public struct Product: Decodable, Identifiable, Equatable {
    public let id: Int
    public let title: String
    public let price: Double
    public let description: String
    public let category: String
    public let image: String // 이미지 URL 문자열
    public let rating: Rating
    
    public struct Rating: Decodable, Equatable {
        public let rate: Double
        public let count: Int
    }
    
    // Equatable 준수를 위한 구현 ( 테스트 코드 등에서 비교를 위해 필요할 수 있음)
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id
    }
}
