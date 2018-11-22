//
//  personStatusViewController.swift
//  myWorkStatus
//
//  Created by Chris Tham on 22/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import UIKit

class personStatusViewController: UIViewController {
    
    //MARK: - Properties
    var person : Person?
    
    //MARK: - Outlets
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var nextLabel: UILabel!
    @IBOutlet weak var nextImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let person = person else {
            fatalError("Person not set")
        }
        personImageView.image = person.image
        personLabel.text = person.name
        statusImageView.image = person.status.getImage()
        statusLabel.text = person.status.getLabel()
        statusLabel.textColor = person.status.getForegroundColor()
        statusLabel.backgroundColor = person.status.getBackgroundColor()
        locationLabel.text = person.currLocation?.getLabel()
        locationImageView.image = person.currLocation?.image
        nextLabel.text = person.nextLocation?.getLabel()
        nextImageView.image = person.nextLocation?.image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
