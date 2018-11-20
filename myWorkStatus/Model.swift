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
    
    func getLabel() -> String {
        switch self {
        case .AtDesk:
            return "At Desk"
        case .InMeeting:
            return "In Meeting"
        case .Event:
            return "Event"
        case .Travel:
            return "Travel"
        case .Home:
            return "At Home"
        case .Leave:
            return "On Leave"
        case .DoNotDisturb:
            return "Do Not Disturb"
        case .OutOfOffice:
            return "Out of Office"
        case .Other(let otherText):
            return otherText
        }
    }
    
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
    
    func format() -> String {
        let df = DateFormatter()
        var outStr = ""
        
        if let startTime = self.start {
            outStr += df.string(from: startTime) + "\n"
        }

        if let endTime = self.end {
            outStr += df.string(from: endTime) + "\n"
        }

        switch self.type {
        case .Desk, .Floor, .Building, .Address:
            outStr += self.title + "\n" + self.address
        case .MeetingRoom:
            outStr += "Room " + self.title + "\n" + self.address
        case .Home:
            outStr += "Home location not displayed"
        case .Other(let otherText):
            outStr += otherText
        }
        
        return outStr
    }
}

struct Person {
    var name, role, team, manager : String
    var mobile, email : String
    var image : UIImage
    var status : StatusType
    var home, defaultLocation, currLocation, nextLocation: Location?
}
