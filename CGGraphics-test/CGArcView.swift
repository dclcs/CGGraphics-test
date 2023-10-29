//
//  CGArcView.swift
//  CGGraphics-test
//
//  Created by cl d on 2023/10/29.
//

import UIKit
import CoreGraphics
class CGArcView: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        let footerRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height)
        
        var arcRect = footerRect
        arcRect.size.height = 8
        context.saveGState()
        
        let arcPath = self.createArcPathFromBottom(of: arcRect, arcHeight: 4, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 360))
        context.addPath(arcPath)
        context.clip()
        
        context.drawLinearGradient(rect: footerRect, startColor: .red, endColor: .red)
        context.restoreGState()
        
    }

    
    func createArcPathFromBottom(
      of rect: CGRect,
      arcHeight: CGFloat,
      startAngle: Angle,
      endAngle: Angle
    ) -> CGPath {
      // 1
      let arcRect = CGRect(
        x: rect.origin.x,
        y: rect.origin.y + rect.height,
        width: rect.width,
        height: arcHeight)
      
      // 2
      let arcRadius = (arcRect.height / 2) + pow(arcRect.width, 2) / (8 * arcRect.height)
      let arcCenter = CGPoint(
        x: arcRect.origin.x + arcRect.width / 2,
        y: arcRect.origin.y + arcRadius)
      let angle = acos(arcRect.width / (2 * arcRadius))
      let startAngle = CGFloat(startAngle.toRadians()) + angle
      let endAngle = CGFloat(endAngle.toRadians()) - angle
      
      let path = CGMutablePath()
      // 3
      path.addArc(
        center: arcCenter,
        radius: arcRadius,
        startAngle: startAngle,
        endAngle: endAngle,
        clockwise: false)
      path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
      path.addLine(to: CGPoint(x: rect.minY, y: rect.maxY))
      // 4
      return path.copy()!
    }

    
}
