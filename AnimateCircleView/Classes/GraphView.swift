//
//  GraphView.swift
//  AnimateCircleView
//
//  Created by David Kadlček on 10/08/2020.
//  Copyright © 2020 David Kadlček. All rights reserved.
//

import UIKit

public class GraphView: UIView {
    public lazy var circleView: CircleView = {
        let circleView = CircleView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    public let animateLabel: AnimateLabel = {
        let label = AnimateLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textColor = .orange
        label.currentValue = 0
        return label
    }()
    
    public var maxValue: Int {
        didSet {
            circleView.maxValue = maxValue
        }
    }
    
    /// Duration of whole circle
    public var animationDuration: Double {
        didSet {
            circleView.animationDuration = animationDuration
            animateLabel.animationDuration = animationDuration / Double(maxValue)
        }
    }
    
    public override init(frame: CGRect) {
        self.maxValue = 1000
        self.animationDuration = 2.5
        super.init(frame: frame)
        setupConstraints()
    }
    
    public func addValue(value: Int) {
        circleView.add(by: value)
        animateLabel.currentValue += Int((CGFloat(value)/CGFloat(maxValue))*100)
    }
    
    public func showHideViews(show: Bool) {
        circleView.showHideLayers(show: show)
        animateLabel.isHidden = !show
    }
    
    required init?(coder: NSCoder) {
        maxValue = 1000
        animationDuration = 2.5
        super.init(coder: coder)
    }
    
    private func setupConstraints() {
        addSubview(circleView)
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.heightAnchor.constraint(equalTo: widthAnchor),
            circleView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        addSubview(animateLabel)
        NSLayoutConstraint.activate([
            animateLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            animateLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            animateLabel.heightAnchor.constraint(lessThanOrEqualTo: circleView.heightAnchor),
            animateLabel.widthAnchor.constraint(lessThanOrEqualTo: circleView.widthAnchor)
        ])
    }
}
