//
//  personStatusViewController.swift
//  myWorkStatus
//
//  Created by Chris Tham on 22/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import UIKit
import MessageUI

class personStatusViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    
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

    @IBAction func phoneButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "tel://\(person!.mobile)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "Enter a message";
        messageVC.recipients = [person!.mobile]
        messageVC.messageComposeDelegate = self
        
        self.present(messageVC, animated: true, completion: nil)
    }
    
    @IBAction func mailButtonPressed(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let mailComposerVC = MFMailComposeViewController()
        
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([person!.email])
        mailComposerVC.setSubject("Need to contact you ...")
        mailComposerVC.setMessageBody("Please contact me!", isHTML: false)
        
        
        self.present(mailComposerVC, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}
