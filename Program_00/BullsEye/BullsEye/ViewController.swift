//
//  ViewController.swift
//  BullsEye
//
//  Created by Eric Binnion on 2/16/15.
//  Copyright (c) 2015 Eric Binnion. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0;
    var targetValue: Int = 0;
    var score = 0;
    var round = 0;
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        startNewRound();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startNewGame() {
        score = 0;
        round = 0;
        startNewRound();
    }
    
    func startNewRound() {
        round += 1;
        targetValue = 1 + Int( arc4random_uniform( 100 ) );
        currentValue = 50;
        slider.value = Float( currentValue );
        targetLabel.text = String( targetValue );
        scoreLabel.text = String( score );
        roundLabel.text = String( round );
    }
    
    @IBAction func showAlert() {
        let difference = abs( targetValue - currentValue );
        var points = 100 - difference;
        
        var title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points;
        
        let message = "Your scored \( points ) points";
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert
        );
        
        let action = UIAlertAction(title: title, style: .Default, handler: { action in self.startNewRound() });
        
        alert.addAction( action );
        
        presentViewController(alert, animated: true, completion: nil);
    }
    
    @IBAction func sliderMoved( slider: UISlider ) {
        currentValue = lroundf( slider.value );
    }

}

