import UIKit

// MARK: - Colors
extension UIButton {
    /// Установка цвета для разных состояний кнопки
    ///
    /// Для фона нормального состояния устанавливается переданный цвет, для состояний
    /// Highlighted и Selected: переданный цвет с 50% прозрачности (по умолчанию)
    /// Disabled: переданный цвет с 15% прозрачности (по умолчанию)
    ///
    /// - Parameter color: Устанавливаемый цвет для нормального состояния
    /// - Parameter alphaHighlighted: Значение альфы для highlighted и selected состояний
    /// - Parameter alphaDisabled: Значение альфы для disabled состояния
    public func adjustColor(_ color: UIColor, alphaHighlighted: CGFloat = 0.5, alphaDisabled: CGFloat = 0.15) {
        setBackground(color: color, for: .normal)
        setBackground(color: color.withAlphaComponent(alphaHighlighted), for: .highlighted)
        setBackground(color: color.withAlphaComponent(alphaHighlighted), for: .selected)
        setBackground(color: color.withAlphaComponent(alphaDisabled), for: .disabled)
    }

    public func adjustOneColor(_ color: UIColor) {
        setBackground(color: color, for: .normal)
        setBackground(color: color, for: .highlighted)
        setBackground(color: color, for: .selected)
        setBackground(color: color, for: .disabled)
    }

    public func setBackground(color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(UIImage.from(color: color), for: state)
    }
}

// MARK: - Images
extension UIButton {
    /// Устанавливает одну картинку для всех состояний
    public func adjustOneBackgroundImage(_ image: UIImage?) {
        setBackgroundImage(image, for: .normal)
        setBackgroundImage(image, for: .highlighted)
        setBackgroundImage(image, for: .selected)
        setBackgroundImage(image, for: .disabled)
    }
}
