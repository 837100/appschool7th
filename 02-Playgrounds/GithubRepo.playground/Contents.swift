import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

enum ResponsError: Error {
    case requestFailed
    case unexpectedResponseStructure
}

func fetchRepos(forUsername username: String, completionHandler: @escaping ([[String: Any]]? , ResponsError?) -> Void) async {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        // 비동기 실행 이후
        let deserialized = try JSONSerialization.jsonObject(with: data, options: [])
        guard let repos = deserialized as? [[String: Any]] else {
            completionHandler(nil, .unexpectedResponseStructure)
            return
        }
        completionHandler(repos, nil)
    } catch {
        print(error)
        completionHandler(nil, .requestFailed)
    }
}


// Task는 async/await 전용 실행블록
Task {
    await fetchRepos(forUsername: "837100") { repos, error in
        if let error {
            print("Error: \(error)")
            return
        }
        print("Repos: \(repos!.count)")
    }
}


// 오래 걸리는 작업, 비동기 호출을 위해, 플레이그라운드 페이지의 무기한 실행을 허용하는 설정
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// 각종 기능 집합, 네트워킹, 날짜, 시간 등 자주 사용되는 기능을 미리 정의해둔 기본 라이브러리
import Foundation
import UIKit

// Foundation 라이브러리 > 네트워킹
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

let urlString = "https://imgs.xkcd.com/comics/api.png"
let url = URL(string: urlString)!
let request = URLRequest(url: url)

print("1")
let task = session.dataTask(with: request) { data, response, error in
    // 요정에 대한 결과 처리
    print("3")
    guard let imageData = data else { return }
    _ = UIImage(data: imageData)
        
}
print("2")

task.resume()
