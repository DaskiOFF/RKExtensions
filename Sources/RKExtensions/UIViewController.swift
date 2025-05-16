import UIKit

extension UIViewController {
    #if os(iOS)
    @available(iOS, introduced: 7.0, deprecated: 11.0, message: "Use adjustsScrollViewInsets(_ scrollView: UIScrollView, adjust: Bool) instead")
    public func adjustsScrollViewInsets(_ adjust: Bool) {
        if adjust == false {
            automaticallyAdjustsScrollViewInsets = false
            extendedLayoutIncludesOpaqueBars = true
        } else {
            automaticallyAdjustsScrollViewInsets = true
            extendedLayoutIncludesOpaqueBars = false
        }
    }
    #endif

    @available(iOS 11.0, *)
    public func adjustsScrollViewInsets(_ scrollView: UIScrollView, adjust: Bool) {
        if adjust {
            scrollView.contentInsetAdjustmentBehavior = .always
        } else {
            scrollView.contentInsetAdjustmentBehavior = .never
        }
    }
}

// MARK: - ChildVC
extension UIViewController {
    /// Add view controller to this as child
    ///
    /// - Parameters:
    ///   - child: Child view controller
    ///   - containerView: Container view for childVC view. Default root view this view controller
    public func add(_ child: UIViewController, containerView: UIView? = nil) {
        addChild(child)

        if let container = containerView {
            container.addSubview(child.view)
        } else {
            view.addSubview(child.view)
        }

        child.didMove(toParent: self)
    }

    /// Remove this view controller from parent view controller
    public func removeFromParentVC() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        self.removeFromParent()
        view.removeFromSuperview()
    }
}

// MARK: - ScrollView
extension UIViewController {
    #if os(iOS)
    public func adjustsScrollViewInsetsFalseIfNeeded() {
        if #available(iOS 11, *) {
        } else {
            adjustsScrollViewInsets(false)
            extendedLayoutIncludesOpaqueBars = false
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    #endif
}
