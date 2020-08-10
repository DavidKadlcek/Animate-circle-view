//
//  AnimateLabel.swift
//  AnimateCircleView
//
//  Created by David Kadlček on 10/08/2020.
//  Copyright © 2020 David Kadlček. All rights reserved.
//

import UIKit

public class AnimateLabel: UILabel {
    
    public var currentValue: Int = 0 {
        didSet {
            value = currentValue - oldValue
            animateLabel()
        }
    }
    
    private var value: Int = 1
    
    public var animationDuration: Double = 1
    
    private func animateLabel() {
        guard currentValue != 0 else {
            self.text = "\(currentValue)%"
            return
        }
        
        let duration = animationDuration * Double(value) * 4
        
        UIView.animate(withDuration: duration, animations: { [weak self] in
            self?.alpha = 0
        }) { [weak self] _ in
            self?.text = "\(self?.currentValue ?? 0)%"
            UIView.animate(withDuration: duration, animations: { [weak self] in
                self?.alpha = 1
            })
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error animateLabel")
    }
}
