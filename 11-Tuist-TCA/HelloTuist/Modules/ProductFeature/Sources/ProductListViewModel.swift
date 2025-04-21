import Foundation
import Combine // @Published 사용 위함
import Network

public class ProductListViewModel: ObservableObject {
    @Published public var products: [Product] = [] // SwiftUI View가 구독할 상품 배열
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? // 오류 메시지
    
    private let apiService: APIService
    
    public init(apiService: APIService = APIService.shared) {
        self.apiService = apiService
    }
    
    // 데이터 로딩 함수
    @MainActor // UI 업데이트를 위해 메인 스레드에서 실행
    public func loadProducts() async {
        isLoading = true
        errorMessage = nil // 이전 오류 메시지 초기화
        
        do {
            products = try await apiService.fetchProducts()
        } catch let error as NetworkError {
            // NetworkError 유형에 따라 구체적인 메시지 설정 가능
            errorMessage = "데이터 로딩 실패: \(error.localizedDescription)"
            print("Error loading products: \(error)")
        } catch {
            errorMessage = "알 수 없는 오류 발생: \(error.localizedDescription)"
            print("Unknown error: \(error)")
        }
        isLoading = false
    }
}

