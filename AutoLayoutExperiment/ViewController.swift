//
//  ViewController.swift
//  AutoLayoutExperiment
//
//  Created by Jacob Sokora on 6/29/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let states = [
        State(name: "Top Left", top: 16, bottom: 0, leading: 16, trailing: 0),
        State(name: "Top Right", top: 16, bottom: 0, leading: 0, trailing: 16),
        State(name: "Bottom Left", top: 0, bottom: 16, leading: 16, trailing: 0),
        State(name: "Bottom Right", top: 0, bottom: 16, leading: 0, trailing: 16)
    ]

    @IBOutlet weak var movingLabel: UILabel!
    @IBOutlet var topContraint: NSLayoutConstraint!
    @IBOutlet var leadingConstraint: NSLayoutConstraint!
    @IBOutlet var trailingConstraint: NSLayoutConstraint!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    var currentState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let newState = states[0]
        
        topContraint.constant = newState.top
        topContraint.isActive = newState.top != 0
        
        bottomConstraint.constant = newState.bottom
        bottomConstraint.isActive = newState.bottom != 0
        
        leadingConstraint.constant = newState.leading
        leadingConstraint.isActive = newState.leading != 0
        
        trailingConstraint.constant = newState.trailing
        trailingConstraint.isActive = newState.trailing != 0
        
        movingLabel.text = newState.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func repositionLabel(_ sender: UIButton) {
        currentState = currentState == states.count - 1 ? 0 : currentState + 1
        let newState = states[currentState]
        
        topContraint.constant = newState.top
        topContraint.isActive = newState.top != 0
        
        bottomConstraint.constant = newState.bottom
        bottomConstraint.isActive = newState.bottom != 0
        
        leadingConstraint.constant = newState.leading
        leadingConstraint.isActive = newState.leading != 0
        
        trailingConstraint.constant = newState.trailing
        trailingConstraint.isActive = newState.trailing != 0
        
        movingLabel.text = newState.name
    }
    
}

struct State {
    let name: String
    let top: CGFloat
    let bottom: CGFloat
    let leading: CGFloat
    let trailing: CGFloat
}
