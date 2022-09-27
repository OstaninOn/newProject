//
//  ViewController.swift
//  newProject
//
//  Created by  aleksandr on 22.09.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var coordinateX = 150
    var coordinateY = 250
    var mySquareWidth = 100
    var mySquareHeight = 100
    var colors : [UIColor] = [.red, .green, .yellow, .blue, .white]
    var color : UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        
        let mySquare = UIView(frame:
                                CGRect(x: coordinateX, y: coordinateY,
                                width: mySquareWidth, height: mySquareHeight))
        
        view.addSubview(mySquare)
        mySquare.backgroundColor = color
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        view.addGestureRecognizer(gesture)
    }
    @objc func gestureFunc() {
        
        coordinateX = Int.random(in: 0..<(Int(view.frame.size.width) - 100))
        coordinateY = Int.random(in: 60..<(Int(view.frame.size.height) - 100))
        
        let colorIndex = Int.random(in: 0..<(colors.count))
        color = colors[colorIndex]
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
        viewDidLoad()
    
        _ = UIView()
    
   
        
    }


}

