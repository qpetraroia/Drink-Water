//
//  ViewController.swift
//  DrinkWater
//
//  Created by Quentin Petraroia on 9/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    var currentProgress: CGFloat = 0
    
    let bottleLabel = BottleLabel()
    var bottleNumberLabel = UILabel()
    var bottleNumber = 4
    let waterLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureWaterLabel()
        configureBottleLabel()
        configureBottleNumberLabel()
        // Do any additional setup after loading the view.
        let center = view.center
        //Create my track layer
        let shadowLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shadowLayer.path = circularPath.cgPath
        view.layer.addSublayer(shadowLayer)
        
        shadowLayer.strokeColor = UIColor.lightGray.cgColor
        shadowLayer.lineWidth = 10
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(shadowLayer)
        
        // create  core animation
        shapeLayer.path = circularPath.cgPath
        view.layer.addSublayer(shapeLayer)
        
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.strokeEnd = currentProgress
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    
    @objc private func handleTap() {
        print("tapped!")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        currentProgress += 0.25
        bottleNumber -= 1
        bottleNumberLabel.text = String(bottleNumber)
        if currentProgress > 1.0 {
            currentProgress = 0.0
            shapeLayer.strokeStart = 0
        }
        if bottleNumber == 0 {
            bottleNumberLabel.text = String(bottleNumber)
            bottleNumber = 5
        }
        basicAnimation.toValue = currentProgress
        shapeLayer.strokeEnd = currentProgress
        
        basicAnimation.duration = 1.5
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "animation")
    }
    
    func configureWaterLabel() {
        view.addSubview(waterLabel)
        waterLabel.textAlignment = .center
        waterLabel.text = "💦"
        waterLabel.sizeToFit()
        waterLabel.center = view.center
    }
    
    
    func configureBottleLabel() {
        view.addSubview(bottleLabel)
        bottleLabel.text = "bottles left"
        
        NSLayoutConstraint.activate([
            bottleLabel.bottomAnchor.constraint(equalTo: waterLabel.topAnchor, constant: -150),
            bottleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)

        ])
    }
    
    func configureBottleNumberLabel() {
        view.addSubview(bottleNumberLabel)
        bottleNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        bottleNumberLabel.text = String(bottleNumber)
        
        NSLayoutConstraint.activate([
            bottleNumberLabel.centerYAnchor.constraint(equalTo: bottleLabel.centerYAnchor),
            bottleNumberLabel.trailingAnchor.constraint(equalTo: bottleLabel.leadingAnchor, constant: -2)
        ])
    }
}


