class Deviece {
    enum Category{
        case watch
        case phone
        case tablet
    }

    enum Orientation {
        case portrait
        case portratiUpsideDown
        case landscapeLeft
        case landscapeRight
    }
    
    let category: Category
    let orientation: Orientation = .portrait
    
    init(category: Category){
        self.category = category
    }
}

let device = Deviece(category: .phone)
let desiredOrientation: Deviece.Orientation = .portrait
let phoneHasDesiredOrientaion: Bool = device.orientation == desiredOrientation

struct UserInterface {
    struct Version {
        let major: Int
        let minor: Int
        let patch: Int
    }
    
    enum Orientation {
        case portrait
        case landscape
    }
    
    let version: Version
    let orientation: Orientation
}

func uiOrientation(for deviceOrientation: Deviece.Orientation) -> UserInterface.Orientation {
    switch deviceOrientation {
    case .portrait, .portratiUpsideDown:
        return .portrait
    case .landscapeLeft, .landscapeRight:
        return .landscape
    }
}
