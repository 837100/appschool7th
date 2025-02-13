/// SwiftUI의 UI 컴포넌트와 SwiftData의 데이터 영속성 기능을 가져옵니다
import SwiftUI
import SwiftData

/// @main은 앱의 진입점을 나타내며, App 프로토콜을 준수하는 메인 구조체를 정의합니다
@main
struct SwiftDataDemoApp: App {
    /// ModelContainer를 저장하는 프로퍼티로, 앱의 데이터 저장소를 초기화합니다
    var sharedModelContainer: ModelContainer = {
        /// SwiftData가 관리할 데이터 모델들을 정의하는 스키마를 생성합니다
        let schema = Schema([
            Product.self,
        ])
        
        /// 스키마를 사용하여 ModelConfiguration을 생성합니다
        /// isStoredInMemoryOnly가 false이므로 데이터가 디스크에 영구 저장됩니다
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        /// 스키마와 설정을 사용하여 ModelContainer를 생성하고
        /// 실패 시 에러 메시지와 함께 앱을 종료합니다
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    /// 앱의 메인 화면을 정의하고
    /// modelContainer 수정자를 통해 생성한 컨테이너를 앱 전체에서 사용할 수 있게 합니다
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
