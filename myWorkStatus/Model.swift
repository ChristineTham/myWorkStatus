//
//  Model.swift
//  myWorkStatus
//
//  Created by Chris Tham on 20/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

enum StatusType {
    case AtDesk
    case InMeeting(String)
    case Event(String)
    case Travel
    case Home
    case Leave
    case DoNotDisturb
    case OutOfOffice
    case Other(String)
    
    func getImage() -> UIImage {
        switch self {
        case .AtDesk:
            return #imageLiteral(resourceName: "AtDesk")
        case .InMeeting:
            return #imageLiteral(resourceName: "InMeeting")
        case .Event:
            return #imageLiteral(resourceName: "Event")
        case .Travel:
            return #imageLiteral(resourceName: "Travel")
        case .Home:
            return #imageLiteral(resourceName: "Home")
        case .Leave:
            return #imageLiteral(resourceName: "Leave")
        case .DoNotDisturb:
            return #imageLiteral(resourceName: "DoNotDisturb")
        case .OutOfOffice:
            return #imageLiteral(resourceName: "OutOfOffice")
        case .Other:
            return #imageLiteral(resourceName: "Other")
        }
    }
}

enum LocationType {
    case Desk
    case MeetingRoom
    case Floor
    case Building
    case Address
    case Home
    case Other(String)
}

struct Location {
    var title, address : String
    var start, end : Date?
    var image : UIImage?
    var type : LocationType
    var gps : CLLocation?
}

struct Person {
    var name, role, team, manager : String
    var mobile, email : String
    var image : UIImage
    var status : StatusType
    var home, defaultLocation, currLocation, nextLocation: Location?
}
