import SwiftUI
import Network // Product 모델 사용 위함

public struct ProductListView: View {
    // ViewModel 인스턴스 (StateObject로 View 생명주기와 연결)
    @StateObject private var viewModel: ProductListViewModel
    
    public init(viewModel: ProductListViewModel = ProductListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("상품 목록 로딩중...") // 로딩 인디케이터
                } else if let errorMessage = viewModel.errorMessage {
                    Text("오류 발생: \(errorMessage)") // 오류 메시지 표시
                        .foregroundStyle(.red)
                        .padding()
                } else {
                    // 상품 목록 표시 List
                    List(viewModel.products) { product in
                        ProductRow(product: product) // 각 상품명
                    }
                }
            }
            .navigationTitle("상품 목록")
            .task { // view가 나타날 때 비동기 작업 수행
                if viewModel.products.isEmpty {
                    await viewModel.loadProducts()
                }
            }
            .refreshable {
                await viewModel.loadProducts()
            }
        }
    }
}


// 상품 목록의 각 행을 위한 View
struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack {
            // AsyncImage: URL로부터 비동기 이미지 로딩 (iOS 15 이상)
            AsyncImage(url: URL(string: product.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // 로딩 중
                case .success(let image):
                    image.resizable() // 이미지 로드 성공
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo") // 로드 실패 시 기본 이미지
                        .foregroundStyle(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 50, height: 50) // 이미지 크기 고정
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer() // 오른쪽으로 밀기
        }
    }
}


