//
//  DWButton.swift
//  DrinkWater
//
//  Created by Quentin Petraroia on 9/21/23.
//

import UIKit

class DWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func configure() {
//        self.setTitle("Drink", for: .normal)
//        titleLabel?.textColor = .systemBlue
//        backgroundColor = .blue
//        translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.cornerRadius = min(bounds.width, bounds.height) / 2
//        layer.masksToBounds = true
//    }
    
    private func configure() {
        let shapeLayer = CAShapeLayer()
        
        let center = center
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
    }


}
