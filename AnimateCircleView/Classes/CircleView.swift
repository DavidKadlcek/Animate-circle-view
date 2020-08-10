//
//  CircleView.swift
//  AnimateCircleView
//
//  Created by David Kadlček on 10/08/2020.
//  Copyright © 2020 David Kadlček. All rights reserved.
//

import UIKit

public class CircleView: UIView {
    
    private var staticLayer: CAShapeLayer = CAShapeLayer()
    private var shapeLayer: CAShapeLayer = CAShapeLayer()
    
    private let lineWidth: CGFloat = 30
    private var minimumScale: CGFloat = 0
    public var maxValue: Int = 1000
    public var animationDuration: Double = 3
    
    public var strokeStaticColor: CGColor = UIColor.lightGray.cgColor
    public var strokeColor: CGColor = UIColor.blue.cgColor
    
    public var fillStaticColor: CGColor = UIColor.clear.cgColor
    public var fillColor: CGColor = UIColor.clear.cgColor
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        staticLayer.strokeColor = strokeStaticColor
        staticLayer.strokeEnd = 1
        staticLayer.lineWidth = lineWidth
        staticLayer.fillColor = fillStaticColor
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.fillColor = fillColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = lineWidth
        
        layer.addSublayer(staticLayer)
        staticLayer.addSublayer(shapeLayer)
        
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.7

    }
    
    public func showHideLayers(show: Bool) {
        shapeLayer.isHidden = !show
        staticLayer.isHidden = !show
    }
    
    public func add(by value: Int) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = (animationDuration/Double(maxValue)) * Double(value)

        shapeLayer.strokeEnd = shapeLayer.strokeEnd + (CGFloat(value) / CGFloat(maxValue))
        
        shapeLayer.add(animation, forKey: "animateCircle")
    }
    
    private func updateLayer() {
        let arcCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight  {
            minimumScale = minimumScale == 0 ? (UIScreen.main.bounds.height - lineWidth - 30) / 2 : minimumScale
        } else {
            minimumScale = (frame.width - lineWidth) / 2
        }

        let radius = minimumScale
        
        staticLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        shapeLayer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
        
        shapeLayer.transform = CATransform3DIdentity
        shapeLayer.frame = bounds
        shapeLayer.transform = CATransform3DMakeRotation(-.pi / 2, 0, 0, 1)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        updateLayer()
    }
}
