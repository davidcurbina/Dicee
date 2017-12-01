//
//  ViewController.swift
//  Dicee
//
//  Created by David Urbina on 11/30/17.
//  Copyright © 2017 David Urbina. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    var rolls : Int = 0
    let imageArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeDice(count:1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        //Random Number generation, comes with UIKit
        rolls = 4
        for index in 1...rolls
        {
            print("Shake \(index)")
            shakeDice(count:6)
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        shakeDice(count: 7)
    }
    
    func shakeDice(count: Int){
        if (count > 0)
        {
            //Add delay for animation
            let when = DispatchTime.now() + 0.35
            DispatchQueue.main.asyncAfter(deadline: when) {
                self.randomDiceIndex1 = Int(arc4random_uniform(6))
                self.randomDiceIndex2 = Int(arc4random_uniform(6))
                
                self.diceImageView1.image = UIImage(named: self.imageArray[self.randomDiceIndex1])
                self.diceImageView2.image = UIImage(named: self.imageArray[self.randomDiceIndex2])
                self.shakeDice(count:count-1)
            }
        }
    }
}

