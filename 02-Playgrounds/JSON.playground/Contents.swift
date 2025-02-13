import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
import Foundation
// 네트워크 설정
let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)
// -> Void 반환값 Void 는 생략 가능
func fetchRepos(forUsername username: String)  {
    let urlString = "https://api.github.com/users/\(username)/repos"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url)
    request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
    
    print("request: \(request.description)")
    
    let task = session.dataTask(with: request) { data, response, error in
        defer {
            PlaygroundPage.current.finishExecution()
        }
        
        guard let jsonData = data else {
            print(error ?? "Network Error")
            return
        }
        
        do {
            let deserialized = try JSONSerialization.jsonObject(with: jsonData, options: [])
            print(deserialized)
        } catch {
            print(error)
        }
    }
    
    task.resume()
}
fetchRepos(forUsername: "apple")
