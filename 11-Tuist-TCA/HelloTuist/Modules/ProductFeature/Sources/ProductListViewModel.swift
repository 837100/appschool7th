import Foundation
import Combine // @Published 사용 위함
import Network

public class ProductListViewModel: ObservableObject {
    @Published public var products: [Product] = [] // SwiftUI View가 구독할 상품 배열
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? // 오류 메시지
    
    // MARK: - Dependencies
    private let apiService: APIService
    
    // MARK: - Initialization
    public init(apiService: APIService = APIService.shared) {
        self.apiService = apiService
    }
    
    // MARK: - Public Methods
    @MainActor // UI 업데이트를 위해 메인 스레드에서 실행
    public func loadProducts() async {
        // 상태 변경 전 예외 처리
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            // Task를 사용하여 비동기 작업을 명시적으로 분리
            let fetchedProducts = try await apiService.fetchProducts()
            
            // UI 업데이트는 반드시 메인 스레드에서 처리
            self.products = fetchedProducts
            
        }  catch {
            // 안전한 오류 처리 메시지
            if let networkError = error as? NetworkError {
                self.errorMessage = networkError.localizedDescription
            } else {
                self.errorMessage = "데이터를 가져오는 중 오류가 발생했습니다: \(error.localizedDescription)"
            }
            print("상품 로딩 오류: \(error)")
        }
        self.isLoading = false
    }
}

