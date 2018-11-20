//
//  myStatusViewController.swift
//  myWorkStatus
//
//  Created by Chris Tham on 20/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import UIKit

class myStatusViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
        statusImage.image = me.status.getImage()
        statusLabel.text = me.status.getLabel()
        locationLabel.text = me.currLocation?.format()
        locationImage.image = me.currLocation?.image
        nextLabel.text = me.nextLocation?.format()
        nextImage.image = me.nextLocation?.image
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
    
}
