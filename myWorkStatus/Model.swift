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
            return "At Event"
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
    
    func getForegroundColor() -> UIColor {
        switch self {
        case .AtDesk:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        case .InMeeting:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .Event:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .Travel:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        case .Home:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        case .Leave:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        case .DoNotDisturb:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        case .OutOfOffice:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        case .Other:
            return #colorLiteral(red: 0.07797776908, green: 0.2222562134, blue: 0.4960105419, alpha: 1)
        }
    }
    
    func getBackgroundColor() -> UIColor {
        switch self {
        case .AtDesk:
            return #colorLiteral(red: 0.6913105845, green: 0.7106819749, blue: 0.2170348763, alpha: 1)
        case .InMeeting:
            return #colorLiteral(red: 0.5067401528, green: 0.5137251019, blue: 0.526117146, alpha: 1)
        case .Event:
            return #colorLiteral(red: 0.5067401528, green: 0.5137251019, blue: 0.526117146, alpha: 1)
        case .Travel:
            return #colorLiteral(red: 0.4175251126, green: 0.8115726113, blue: 0.9541099668, alpha: 1)
        case .Home:
            return #colorLiteral(red: 0.4175251126, green: 0.8115726113, blue: 0.9541099668, alpha: 1)
        case .Leave:
            return #colorLiteral(red: 0.4175251126, green: 0.8115726113, blue: 0.9541099668, alpha: 1)
        case .DoNotDisturb:
            return #colorLiteral(red: 0.8876586556, green: 0.08936477453, blue: 0.2413475513, alpha: 1)
        case .OutOfOffice:
            return #colorLiteral(red: 0.4175251126, green: 0.8115726113, blue: 0.9541099668, alpha: 1)
        case .Other:
            return #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
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
    
    func getLabel() -> String {
        var outStr = ""
        
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

struct Activity {
    var activity : String
    var start, end : DateComponents
    var status : StatusType
    var image : UIImage
    var location : Location
    
    func getLabel() -> String {
        var outStr = ""
        switch status {
        case .AtDesk:
            outStr = "Location: \(activity)\n"
            outStr += "Until \(String(end.hour!)):00\n"
            outStr += location.address
        case .InMeeting(let meetingText):
            outStr = "Meeting: \(meetingText)\n"
            outStr += "\(String(start.hour!)):00-\(String(end.hour!)):00\n"
            outStr += location.address
        case .Event(let eventText):
            outStr = "Event: \(eventText)\n"
            outStr += "\(String(start.hour!)):00-\(String(end.hour!)):00\n"
            outStr += location.address
        case .Travel:
            outStr = "Travelling\nEstimated Arrival \(String(end.hour!)):00"
        case .Home:
            outStr = "At Home\nLeave by \(String(end.hour!)):00"
        case .Leave:
            outStr = "On Leave\nReturn on #TBD#"
        case .DoNotDisturb:
            outStr = "Do Not Disturb\nUntil \(String(end.hour!)):00"
        case .OutOfOffice:
            outStr = "Out of Office\nUntil \(String(end.hour!)):00"
        case .Other(let otherText):
            outStr = otherText
            outStr += "\nUntil \(String(end.hour!)):00"
        }
        
        return outStr
    }
    
    func getNextLabel() -> String {
        var outStr = ""
        switch status {
        case .AtDesk:
            outStr = "Available\n"
            outStr += "From \(String(start.hour!)):00\n"
            outStr += location.address
        case .InMeeting(let meetingText):
            outStr = "Meeting: \(meetingText)\n"
            outStr += "\(String(start.hour!)):00-\(String(end.hour!)):00\n"
            outStr += location.address
        case .Event(let eventText):
            outStr = "Event: \(eventText)\n"
            outStr += "\(String(start.hour!)):00-\(String(end.hour!)):00\n"
            outStr += location.address
        case .Travel:
            outStr = "Estimated Departure \(String(start.hour!)):00"
        case .Home:
            outStr = "At Home"
        case .Leave:
            outStr = "On Leave\nReturn on #TBD#"
        case .DoNotDisturb:
            outStr = "Do Not Disturb\nFrom \(String(start.hour!)):00"
        case .OutOfOffice:
            outStr = "Out of Office\nFrom \(String(start.hour!)):00"
        case .Other(let otherText):
            outStr = otherText
            outStr += "\nFrom \(String(start.hour!)):00"
        }
        
        return outStr
    }

}
