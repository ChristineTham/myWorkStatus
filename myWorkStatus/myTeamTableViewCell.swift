//
//  myTeamTableViewCell.swift
//  myWorkStatus
//
//  Created by Chris Tham on 22/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import UIKit

class myTeamTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
