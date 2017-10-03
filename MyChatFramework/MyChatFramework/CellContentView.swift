//
//  CellContentView.swift
//  MyChatFramework
//
//  Created by Mac on 9/28/17.
//  Copyright © 2017 David Gedeon. All rights reserved.
//

import UIKit
@objc
public enum MessageSender:Int{
    case user = 0
    case isaiahTheTraitor = 1
    
    
}

@IBDesignable
public class CellContentView: UIView {

    //Cell Content View Parameters
    @IBInspectable var bubbleType:MessageSender = .user
    @IBInspectable var heightOfTriangle:CGFloat = 20.0{
        willSet{
            guard heightOfTriangle > 10.0 else{
                heightOfTriangle = 10.0
                return
            }
        }
    }
    //@IBInspectable var heightOfTriangle:CGFloat = 20.0
    @IBInspectable var widthOfTriangle:CGFloat = 40
    @IBInspectable var borderRadius:CGFloat = 8.0
    @IBInspectable var strokeWidth:CGFloat = 3.0
    @IBInspectable var strokeColor:UIColor = .blue
    @IBInspectable var fillColor:UIColor = .green
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override public func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x:0.0, y:self.bounds.size.height)
        context?.scaleBy(x:1.0, y: -1.0)
        let currentFrame = self.bounds
        context?.setLineJoin(.round)
        context?.setLineWidth(strokeWidth)
        context?.setStrokeColor(strokeColor.cgColor)
        context?.setFillColor(fillColor.cgColor)
        context?.beginPath()
        
        //Triangle Magic
        context?.move(to: CGPoint(x: borderRadius + strokeWidth + 0.5,
                                  y:strokeWidth + heightOfTriangle + 0.5))
        
        context?.addLine(to: CGPoint(x: round(currentFrame.size.width * 0.5 - widthOfTriangle * 0.5) + 0.5,
                                     y: heightOfTriangle + strokeWidth + 0.5))
        
        context?.addLine(to: CGPoint(x: round(currentFrame.size.width * 0.5) + 0.5,
                                     y: strokeWidth + 0.5))
        
        context?.addLine(to: CGPoint(x: round(currentFrame.size.width * 0.5 + widthOfTriangle * 0.5) + 0.5, y: strokeWidth + 0.5))
        
        context?.addArc(tangent1End: CGPoint(x: currentFrame.size.width - strokeWidth - 0.5, y:strokeWidth + heightOfTriangle + 0.5),
                        tangent2End: CGPoint(x: currentFrame.size.width - strokeWidth - 0.5, y:strokeWidth - heightOfTriangle - 0.5),
                        radius: borderRadius - strokeWidth)
        
        
        context?.addArc(tangent1End: CGPoint(x: currentFrame.size.width - strokeWidth - 0.5, y: currentFrame.size.height - strokeWidth - 0.5),
                        tangent2End: CGPoint(x: round(currentFrame.size.width * 0.5 + widthOfTriangle * 0.5) - strokeWidth + 0.5, y: currentFrame.size.height - strokeWidth - 0.5),
                        radius: borderRadius - strokeWidth)
        
        context?.addArc(tangent1End: CGPoint(x: strokeWidth + 0.5, y: currentFrame.size.height - strokeWidth - 0.5),
                        tangent2End: CGPoint(x:strokeWidth + 0.5, y:strokeWidth + heightOfTriangle + 0.5),
                        radius: borderRadius - strokeWidth)
        
        context?.addArc(tangent1End: CGPoint(x: strokeWidth + 0.5, y: strokeWidth + heightOfTriangle + 0.5),
                        tangent2End: CGPoint(x: currentFrame.size.width - strokeWidth - 0.5, y: strokeWidth + heightOfTriangle + 0.5),
                        radius: borderRadius - strokeWidth)
        
        
        
        context?.closePath()
        context?.drawPath(using: .fillStroke)
        
    }
    

}
