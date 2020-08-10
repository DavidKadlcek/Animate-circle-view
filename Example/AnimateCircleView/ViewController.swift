//
//  ViewController.swift
//  AnimateCircleView
//
//  Created by DavidKadlcek on 08/10/2020.
//  Copyright (c) 2020 DavidKadlcek. All rights reserved.
//

import UIKit
import AnimateCircleView

class ViewController: UIViewController {

    let graphView: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.maxValue = 1600
        view.animationDuration = 2
        view.circleView.strokeStaticColor = UIColor.red.cgColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        graphView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        view.addSubview(graphView)
        NSLayoutConstraint.activate([
            graphView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            graphView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            graphView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            graphView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -30)
        ])
    }
    
    @objc
    func handleTap() {
        graphView.addValue(value: 200)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

