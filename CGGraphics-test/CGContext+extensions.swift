//
//  CGContext+extensions.swift
//  CGGraphics-test
//
//  Created by cl d on 2023/10/29.
//

import CoreGraphics
import UIKit
extension UIColor {
  static let rwShadow = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
  static let rwLightGray = UIColor(red: 230/255.0, green: 230/255.0, blue: 230/255.0, alpha: 1)
  static let rwDarkGray = UIColor(red: 187/255.0, green: 187/255.0, blue: 187/255.0, alpha: 1)
  static let rwLightBlue = UIColor(red: 105/255.0, green: 179/255.0, blue: 216/255.0, alpha: 1)
  static let rwDarkBlue = UIColor(red: 21/255.0, green: 92/255.0, blue: 136/255.0, alpha: 1)
  static let rwLightPurple = UIColor(red: 147/255.0, green: 105/255.0, blue: 216/255.0, alpha: 1)
  static let rwDarkPurple = UIColor(red: 72/255.0, green: 22/255.0, blue: 137/255.0, alpha: 1)
}
extension CGContext {
    func drawLinearGradient(rect: CGRect, startColor: UIColor, endColor: UIColor) {
      let gradient = CGGradient(colorsSpace: nil, colors: [startColor.cgColor, endColor.cgColor] as CFArray, locations: [0, 1])!
      
      let startPoint = CGPoint(x: rect.midX, y: rect.minY)
      let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
      saveGState()
      addRect(rect)
      clip()
      drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
      restoreGState()
    }
}


typealias Angle = Measurement<UnitAngle>

extension Measurement where UnitType == UnitAngle {
  init(degrees: Double) {
    self.init(value: degrees, unit: .degrees)
  }
  
  func toRadians() -> Double {
    return converted(to: .radians).value
  }
}
