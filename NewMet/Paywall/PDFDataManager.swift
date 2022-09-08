import SwiftUI
import Foundation

public extension Notification.Name {
    static let showAlert = Notification.Name("showAlert")
}

struct AlertData {
    let title: Text
    let message: Text
    let primaryButton: Alert.Button?
    let secondaryButton: Alert.Button?
    static let empty = AlertData(title: Text(""),
                                 message: Text(""),
                                 primaryButton: nil,
                                 secondaryButton: nil
    )
}

func presentAlert(title: String, message: String, primaryAction: UIAlertAction, secondaryAction: UIAlertAction? = nil) {
    PDFDataManager.shared.presentAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
}

/// Main data manager class
class PDFDataManager: ObservableObject {
    /// Dynamic properties that the UI will react to
    
    static let shared = PDFDataManager()
    
//    public var alert: Alert?
    
    @Published var showPaywall: Bool = false
    @Published var showedPerSession: Bool = false
    
    
    /// Dynamic properties that the UI will react to AND store values in UserDefaults
    @AppStorage("isPremiumUser") var isPremiumUser: Bool = false {
        didSet { objectWillChange.send() }
    }
    
    func presentAlert(title: String, message: String, primaryAction: UIAlertAction, secondaryAction: UIAlertAction? = nil) {
        
        if (secondaryAction != nil) {
            NotificationCenter
                .default
                .post(
                    name: .showAlert,
                    object: AlertData(title: Text(title),
                                      message: Text(message),
                                      primaryButton: .default(Text(primaryAction.getTitle())) {
                                          primaryAction.trigger()
                                          
                                      },
                                      secondaryButton:.default(Text(secondaryAction!.getTitle())) {
                                          secondaryAction!.trigger()
                                      }
                                     )
                )
        }
        
        if (secondaryAction == nil) {
            NotificationCenter
                .default
                .post(
                    name: .showAlert,
                    object: AlertData(title: Text(title),
                                      message: Text(message),
                                      primaryButton: .default(Text(primaryAction.getTitle())) {
                                          primaryAction.trigger()
                                      },
                                      secondaryButton: .default(Text("")) { }
                                     )
                )
        }
    }
}

extension UIAlertAction {
    typealias AlertHandler = @convention(block) (UIAlertAction) -> Void
    func trigger() {
        guard let block = value(forKey: "handler") else {
            //XCTFail("Should not be here")
            return
        }
        let handler = unsafeBitCast(block as AnyObject, to: AlertHandler.self)
        handler(self)
    }
    
    func getTitle() -> String {
        guard let block = value(forKey: "title") else {
            //XCTFail("Should not be here")
            return ""
        }
        //let obj = unsafeBitCast(block as String, to: AlertHandler.self)
        //        handler(self)
        return block as! String
    }
}
