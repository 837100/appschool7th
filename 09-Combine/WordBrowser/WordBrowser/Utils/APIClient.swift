//
//  APIClient.swift
//  WordBrowser
//
//  Created by NO SEONGGYEONG on 4/10/25.
//


import Foundation

// MARK: - 오류 열거형
enum WordsAPIError: Error{
    case invalidURL
    case invalidServerResponse
    case decodingError(Error)
    case networkError(Error)
    case apiKeyMissing
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "잘못된 URL이 생성되었습니다."
        case .invalidServerResponse: return "잘못 된 서버 응답입니다."
        case .decodingError(let error): return "JSON 디코딩 오류: \(error.localizedDescription)"
        case .apiKeyMissing: return "API 키가 누락되었습니다. 설정 섹션에 추가해주세요."
        }
    }
}

struct APIClient {
    private static let decoder = JSONDecoder()
    
    static func buildURLRequest(for searchTerm: String, random: Bool = false) throws -> URLRequest {
        guard let rapidApiKey = Bundle.main.object(forInfoDictionaryKey: "ApiKey") as? String,
              let rapidApiHost = Bundle.main.object(forInfoDictionaryKey: "APIHost") as? String
                let wordsApiBaseURL = Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String
        else {
            throw WordsAPIError.apiKeyMissing
        }
        
        print("API 키: \(rapidApiKey)")
        print("API 호스트: \(rapidApiHost)")
        print("API 기본 URL: \(wordsApiBaseURL)")
        
        // 요청된 경우 랜덤 엔드포인트를 사용하고, 그렇지 않으면 용어를 검색
        let urlString = random ? (wordsApiBaseURL + "?random=true") : (wordsApiBaseURL + searchTerm.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)
        
        guard let url = URL(string: urlString) else {
            throw WordsAPIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.
    }
    static func fetchWord(_ request:)
    
}
