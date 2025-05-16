import UIKit

extension UIView {
    // MARK: - Corners Radius
    /// Скругление углов UIView
    ///
    /// - Parameters:
    ///   - cornerRadius: Радиус скругления
    ///   - corners: Какие углы закрыгляем
    public func roundCorners(cornerRadius: CGFloat, corners: UIRectCorner) {
        self.clipsToBounds = true
        if corners == .allCorners {
            self.layer.cornerRadius = cornerRadius
            return
        }

        if #available(iOS 11, *) {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = []
            if corners.contains(.topLeft) { self.layer.maskedCorners.formUnion(.layerMinXMinYCorner) }
            if corners.contains(.bottomLeft) { self.layer.maskedCorners.formUnion(.layerMinXMaxYCorner) }
            if corners.contains(.topRight) { self.layer.maskedCorners.formUnion(.layerMaxXMinYCorner) }
            if corners.contains(.bottomRight) { self.layer.maskedCorners.formUnion(.layerMaxXMaxYCorner) }
        } else {
            let path = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
        }
    }

}

// MARK: - Gradient
extension UIView {
    public enum GradientDirection {
        case verticaly
        case horizontaly
        case custom(start: CGPoint, end: CGPoint)
    }

    /// Сделать градиентный слой
    ///
    /// - Parameters:
    ///   - from: С какого цвета начинать
    ///   - to: Каким цветом заканчивать
    ///   - direction: Направление top -> botttom, left -> right
    public func gradientBackground(from: UIColor, to: UIColor, direction: GradientDirection = GradientDirection.verticaly) {
        let nameGradientSublayer: String = "17001"
        var gradientLayer: CAGradientLayer!

        if let sublayers: [CALayer] = self.layer.sublayers {
            for sublayer in sublayers {
                if let name: String = sublayer.name, name == nameGradientSublayer {
                    gradientLayer = sublayer as? CAGradientLayer
                    break
                }
            }
        }

        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer.name = nameGradientSublayer
            self.layer.insertSublayer(gradientLayer, at: 0)
        }

        gradientLayer.frame = self.bounds
        gradientLayer.colors = [from.cgColor, to.cgColor]
        switch direction {
        case .verticaly:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .horizontaly:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .custom(let start, let end):
            gradientLayer.startPoint = start
            gradientLayer.endPoint = end
        }
    }
}

// MARK: - MakeImage
extension UIView {
    public func makeImage() -> UIImage? {

        #if os(iOS)
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, UIScreen.main.scale)
        #else
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 1)
        #endif
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image
    }
}
