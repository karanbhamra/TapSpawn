//
//  ViewController.swift
//  TapSpawn
//
//  Created by Karan Bhamra on 6/6/17.
//  Copyright © 2017 Karan Bhamra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var count = 0
	let maxLimit = 10

	@IBOutlet weak var resetButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		title = "Count : \(count)"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func randomColor() -> UIColor {
		let red = (CGFloat(arc4random_uniform(256)) / 255.0)
		let green = (CGFloat(arc4random_uniform(256)) / 255.0)
		let blue = (CGFloat(arc4random_uniform(256)) / 255.0)
		let myColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
		
		return myColor
	}
	
	func updateTitle(newCount: Int) {
		count = newCount
		title = "Count : \(count)"
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		var x: CGFloat
		var y: CGFloat
		if let touch = touches.first {
			if (count < maxLimit) {
				let position = touch.location(in: self.view)
				x = position.x
				y = position.y
				let randWidth = CGFloat(arc4random_uniform(80) + 10)
				let randHeight = CGFloat(arc4random_uniform(80) + 10)
				let firstframe = CGRect(x: x, y: y, width: randWidth, height: randHeight)
				
				
				let firstview = UIView(frame: firstframe)
				firstview.backgroundColor = randomColor()
				
				if (Double(arc4random_uniform(100)) < 50) {
					firstview.layer.cornerRadius = 25
				}
				
				view.addSubview(firstview)
				print("Adding subview")
				
				count += 1
				updateTitle(newCount: count)
			} // end count < maxlimit
			else {
				view.subviews[0].removeFromSuperview()
				count -= 1
				updateTitle(newCount: count)
				print("Removing subview")
			}
			
			
		} // end touch
	}

	@IBAction func resetButtonClicked(_ sender: Any) {
		print("Reset pressed")
		if (count > 0) {
			for iView in view.subviews {
				iView.removeFromSuperview()
			}
			updateTitle(newCount: 0)
		}
	}
	
}

