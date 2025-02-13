enum FileTransferError: Error {
    case noConnection
    case lowBandwidth
    case fileNotFound
}


func fileTransfer() throws {
    
    let connectionOK = true
    let connectionSpeed: Int = 20
    let fileFound: Bool = true
    
    guard connectionOK else {
        throw FileTransferError.noConnection
    }
    guard connectionSpeed > 30 else {
        throw FileTransferError.lowBandwidth
    }
    guard fileFound else {
        throw FileTransferError.fileNotFound
    }
    
    // 파일 전송 로직
}

func removeTmpFiles() {}
func closeConnection() {}
//func fileTransfer() throws {}

func sendFile() -> String {
    defer {
        removeTmpFiles()
        closeConnection()
    }
    
    do {
        try fileTransfer()
        return "Successful transfer"
    } catch FileTransferError.noConnection{
        return "No Network Connection"
    } catch FileTransferError.lowBandwidth {
        return "FileTransferError.lowBandwidth"
    }catch FileTransferError.fileNotFound{
        return "File not Found"
    } catch {
        return "Unknown error"
    }
}
