//
//  ViewController.swift
//  TTRCalc
//
//  Created by Nick Ni on 7/30/18.
//  Copyright © 2018 Nick Ni. All rights reserved.
//
//TODO: create rooms to join, once in can see other peoples train track numbers, see if they tallied everything right, ranks everyone
//TODO: aesthetically- change "tickets completed" to "total points from tickets", make the train turn around when resetting
//TODO(BUGS): when total reset it should make longest path go back to off

import UIKit

class tickets {
    var ticketName: String
    var points: Int
    init(ticketName: String, points: Int){
        self.ticketName = ticketName
        self.points = points
    }
}

class ViewController: UIViewController {
    
    //1
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var oneCounter: UILabel!
    private var oneCount = 0;
    //2
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var twoCounter: UILabel!
    private var twoCount = 0;
    //3
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var threeCounter: UILabel!
    private var threeCount = 0;
    //4
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fourCounter: UILabel!
    private var fourCount = 0;
    //5
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var fiveCounter: UILabel!
    private var fiveCount = 0;
    //6
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sixCounter: UILabel!
    private var sixCount = 0;
    
    //longest route? +10
    @IBOutlet var longestRouteYN: UISwitch!
    
    //tickets
    @IBOutlet var ticketPoints: UITextField!
    
    //calculate button
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var totalPoints: UILabel!
    @IBOutlet var label: UILabel!
    
    //reset everything
    @IBOutlet var allReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketPoints.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view, typically from a nib.
        self.totalPoints.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //generally outline for changing labels
    //TODO: Condense down into one function
    //maybe make changing text its own function
    //1
    @IBAction func oneCountChange(_ sender: Any) {
        oneCount += 1
        oneCounter.text = "\(oneCount)"
    }
    //2
    @IBAction func twoCountChange(_ sender: Any) {
        twoCount += 1
        twoCounter.text = "\(twoCount)"
    }
    //3
    @IBAction func threeCountChange(_ sender: Any) {
        threeCount += 1
        threeCounter.text = "\(threeCount)"
    }
    //4
    @IBAction func fourCountChange(_ sender: Any) {
        fourCount += 1
        fourCounter.text = "\(fourCount)"
    }
    //5
    @IBAction func fiveCountChange(_ sender: Any) {
        fiveCount += 1
        fiveCounter.text = "\(fiveCount)"
    }
    //6
    @IBAction func sixCountChange(_ sender: Any) {
        sixCount += 1
        sixCounter.text = "\(sixCount)"
    }

    //reset scores
    @IBAction func resetButtonFunc(_ sender: Any) {
        oneCount = 0
        oneCounter.text = "\(oneCount)"
        twoCount = 0
        twoCounter.text = "\(twoCount)"
        threeCount = 0
        threeCounter.text = "\(threeCount)"
        fourCount = 0
        fourCounter.text = "\(fourCount)"
        fiveCount = 0
        fiveCounter.text = "\(fiveCount)"
        sixCount = 0
        sixCounter.text = "\(sixCount)"
    }
    

    
    //total calculator
    @IBAction func calculateTotal(_ sender: Any) {
        //finding total
        var total = 0
        var add = 0
        total += (oneCount + twoCount*2 + threeCount*4 + fourCount*7 + fiveCount*10 + sixCount*15)
        if (longestRouteYN.isOn) {
            total += 10
        }
        if (ticketPoints.text?.isEmpty)! {
            add = 0
        } else {
            add = Int(ticketPoints.text!)!
        }
        total += add
        totalPoints.text = "\(total)"
        
        //animations
        self.label.isHidden = true
        UIView.animate(withDuration: 2.3, animations: {
            self.calculateButton.frame = CGRect(x: 350, y:550, width: 377, height: 119)
        }) { (finished) in
            self.totalPoints.isHidden = false
            self.allReset.isHidden = false
        }
    }
    
    //post animation to reset train
    @IBAction func resetTrain(_ sender: Any) {
        self.allReset.isHidden = true
        self.totalPoints.isHidden = true
        
        //copy pasted from resetButtonFunc because dont know how to call it here
        oneCount = 0
        oneCounter.text = "\(oneCount)"
        twoCount = 0
        twoCounter.text = "\(twoCount)"
        threeCount = 0
        threeCounter.text = "\(threeCount)"
        fourCount = 0
        fourCounter.text = "\(fourCount)"
        fiveCount = 0
        fiveCounter.text = "\(fiveCount)"
        sixCount = 0
        sixCounter.text = "\(sixCount)"

        
        ticketPoints.text = "0"
        
        UIView.animate(withDuration: 1, animations: {
            self.calculateButton.frame = CGRect(x: -221, y:550, width: 377, height: 119)
        }) { (finished) in
            self.label.isHidden = false
        }
    }
    
    
    
}
