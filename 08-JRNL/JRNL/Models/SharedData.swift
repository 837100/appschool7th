//
//  SharedData.swift
//  JRNL
//
//  Created by NO SEONGGYEONG on 3/28/25.
//

import Foundation

class SharedData {
    // MARK: - Properties
    static let shared = SharedData()
    private var journalEntries: [JournalEntry] = []
    
    // MARK: - Initializer
    private init() {
        journalEntries = []
    }
    
    // MARK: access methods
    
    // 데이터 개수 반환
    var numberOfJournalEntries: Int {
        return journalEntries.count
    }
    
    // 전체 데이터 반환
    func getAllJournalEntries() -> [JournalEntry] {
        return journalEntries
    }
    
    func getJournalEntry(at index: Int) -> JournalEntry {
        return journalEntries[index]
    }
    
    // 데이터 추가
    func addJournalEntry(_ entry: JournalEntry) {
        journalEntries.append(entry)
        savaJournalEntrtiesData()
    }
    
    // 데이터 삭제
    func removeJournalEntry(at index: Int) {
        journalEntries.remove(at: index)
        savaJournalEntrtiesData()
    }
    
    // MARK - Persistence
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadJournalEntriesData() {
        let filePath = getDocumentDirectory().appendingPathComponent("journalEntriesData.json")
        
        do {
            let data = try Data(contentsOf: filePath)
            journalEntries = try JSONDecoder().decode([JournalEntry].self, from: data)
            
        } catch {
            print("Failed to load journal entries data")
        }
    }
    
    func savaJournalEntrtiesData() {
        let pathDirectory = getDocumentDirectory()
        // 혹시나 해당 디렉토리가 없으면 만들고 있으면 넘어감
        try? FileManager().createDirectory(at: pathDirectory, withIntermediateDirectories: true)
        
        let filePath = getDocumentDirectory().appendingPathComponent("journalEntriesData.json")
        
        do {
            let data = try JSONEncoder().encode(journalEntries)
            // . atomicWrite : 파일을 쓸 대 임시 파일을 만들어서 쓰고, 쓰기가 완료되면 원래 파일로 대체
            try data.write(to: filePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Failed to save journal entries data")
        }
    }
}
