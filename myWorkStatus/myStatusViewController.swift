//
//  myStatusViewController.swift
//  myWorkStatus
//
//  Created by Chris Tham on 20/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import UIKit

class myStatusViewController: UIViewController {
    
    //MArK: - Properties
    
    var indexStatus = 0
    
    //MARK: - Outlets
    
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var nextImage: UIImageView!
    
    //MARK: - Initialisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.becomeFirstResponder() // To get shake gesture

        // Do any additional setup after loading the view.
//        statusImage.image = me.status.getImage()
//        statusLabel.text = me.status.getLabel()
//        locationLabel.text = me.currLocation?.getLabel()
//        locationImage.image = me.currLocation?.image
//        nextLabel.text = me.nextLocation?.getLabel()
//        nextImage.image = me.nextLocation?.image
        
        updateStatus()
    }
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            updateStatus()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: private functions
    
    private func updateStatus() {
        let nextIndex = (indexStatus + 1) % myActivities.count
        let currActivity = myActivities[indexStatus]
        let nextActivity = myActivities[nextIndex]

        statusImage.image = currActivity.status.getImage()
        statusLabel.text = currActivity.status.getLabel()
        statusLabel.textColor = currActivity.status.getForegroundColor()
        statusLabel.backgroundColor = currActivity.status.getBackgroundColor()
        locationLabel.text = currActivity.getLabel()
        locationImage.image = currActivity.image
        nextLabel.text = nextActivity.getNextLabel()
        nextImage.image = nextActivity.location.image!

        indexStatus = nextIndex
    }
}
