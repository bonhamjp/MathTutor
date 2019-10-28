//
//  LoadingBar.swift
//  MathTutor
//
//  Created by John on 10/15/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

class LoadingBar: UIView {

    let barColor = UIColor.init(red: 276.0 / 255.0, green: 106.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0).cgColor
    var percentComplete: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let context: CGContext! = UIGraphicsGetCurrentContext()

        let progressRect = CGRect(
            x: 0.0,
            y: 0.0,
            width: rect.width * percentComplete,
            height: rect.height
        )

        context.setFillColor(barColor)
        context.addRect(progressRect)
        context.drawPath(using: .fill)
    }
    
    func setPercentComplete(percentage: CGFloat) {
        percentComplete = percentage
    }
    
}
