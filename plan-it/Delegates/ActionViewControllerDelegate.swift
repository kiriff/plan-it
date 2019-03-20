import Foundation
import UIKit

protocol ActionViewControllerDelegate {
    func done(sourse: UIViewController, data: Any?)
    
    func cancel(sourse: UIViewController, data: Any?)
}

extension ActionViewControllerDelegate {
    func done(sourse: UIViewController, data: Any?) {
        fatalError("not implemented")
    }
    
    func cancel(sourse: UIViewController, data: Any?) {
        fatalError("not implemented")
    }
}
