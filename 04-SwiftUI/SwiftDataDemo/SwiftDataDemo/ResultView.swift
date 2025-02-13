/// SwiftUI와 SwiftData 모듈을 가져옵니다.
import SwiftUI
import SwiftData

/// 검색 결과를 표시하는 `ResultView` 구조체를 정의합니다.
struct ResultView: View {
    /// 검색할 이름을 저장하는 프로퍼티입니다.
    var name: String
    
    /// SwiftData의 모델 컨텍스트를 환경 변수에서 가져옵니다.
    @Environment(\.modelContext) private var modelContext
    
    /// 검색 결과를 저장하는 상태 프로퍼티로, 초기값은 빈 배열입니다.
    @State private var matches: [Product] = []
    
    /// 사용자 인터페이스를 정의하는 본문입니다.
    var body: some View {
        /// 검색 결과를 표시하는 세로형 스택을 생성합니다.
        VStack {
            /// 검색 결과를 나열하기 위한 리스트를 생성합니다.
            List {
                /// 검색된 각 제품에 대해 행을 생성합니다.
                ForEach(matches) { product in
                    /// 제품의 이름과 수량을 나열하는 수평 스택입니다.
                    HStack {
                        /// 제품 이름을 표시하거나 "Not found"로 대체합니다.
                        Text(product.name ?? "Not found")
                        /// 공간을 채워 이름과 수량 간 간격을 만듭니다.
                        Spacer()
                        /// 제품 수량을 표시하거나 "Not found"로 대체합니다.
                        Text(product.quantity ?? "Not found")
                    }
                }
            }
            /// 네비게이션 바의 제목을 설정합니다.
            .navigationTitle("Results")
        }
        /// 뷰가 표시될 때 비동기 작업을 수행합니다.
        .task {
            /// 제품 데이터를 검색하기 위한 조건을 설정한 FetchDescriptor를 생성합니다.
            let descriptor = FetchDescriptor<Product>(predicate: #Predicate<Product> { product in
                /// 제품 이름에 검색할 문자열이 포함되어 있는지 확인합니다.
                product.name?.contains(name) ?? false
            })

            do {
                /// 조건에 맞는 데이터를 모델 컨텍스트에서 가져옵니다.
                matches = try modelContext.fetch(descriptor)
            } catch {
                /// 데이터 가져오기 중 오류가 발생하면 로그를 출력하고 결과를 초기화합니다.
                print("Error fetching products: \(error)")
                matches = []
            }
        }
    }
}

/// 미리보기를 위한 코드를 주석 처리합니다.
//#Preview {
//    /// "test"라는 이름으로 초기화된 `ResultView`의 미리보기를 생성합니다.
//    ResultView(name: "test")
//        /// 메모리 내에서 `Product` 모델 컨테이너를 설정합니다.
//        .modelContainer(for: Product.self, inMemory: true)
//}
