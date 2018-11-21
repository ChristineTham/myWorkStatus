//
//  SampleData.swift
//  myWorkStatus
//
//  Created by Chris Tham on 20/11/18.
//  Copyright © 2018 Transport for NSW. All rights reserved.
//

import Foundation
import UIKit

private let secondsinDay = 24.0*60*60

var transportLocations: [String : Location] = [
    "L1,MacqPark" : Location(
        title: "Level 1", address: "22 Giffnock Avenue, Macquarie Park NSW 2113",
        start: nil, end: nil,
        image: #imageLiteral(resourceName: "22giffnock-sat"),
        type: .Floor, gps: nil
    ),
    "L6,Lee" : Location(title: "Level 6", address: "18 Lee Street, Chippendale NSW 2008", start: nil, end: nil, image: #imageLiteral(resourceName: "leest-sat"), type: .Floor, gps: nil),
    "L25,477Pitt" : Location(title: "Level 25", address: "477 Pitt Street, Haymarket NSW 2008", start: nil, end: nil, image: #imageLiteral(resourceName: "477pitt-flat"), type: .Floor, gps: nil),
    "L26,477Pitt" : Location(title: "Level 26", address: "477 Pitt Street, Haymarket NSW 2008", start: nil, end: nil, image: #imageLiteral(resourceName: "477pitt-flat"), type: .Floor, gps: nil),
    "L27,477Pitt" : Location(title: "Level 27", address: "477 Pitt Street, Haymarket NSW 2008", start: nil, end: nil, image: #imageLiteral(resourceName: "477pitt-flat"), type: .Floor, gps: nil),
    "HeadOffice" : Location(title: "Head Office", address: "18 Lee Street, CHIPPENDALE NSW 2008", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "Burwood" : Location(title: "Burwood", address: "Level 6, 2-14 Elsie Street, BURWOOD NSW 2134", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "Mascot" : Location(title: "Mascot", address: "Gateway Building, Level 4, 241 O’Riordan Street, MASCOT NSW 2020", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "Parramatta" : Location(title: "Parramatta", address: "Level 6, 16-18 Wentworth Street, PARRAMATTA NSW 2150", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "NSWTrains" : Location(title: "NSW Trains", address: "470 Pitt St, SYDNEY NSW 2008", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "RMS" : Location(title: "Roads and Maritime Services", address: "20-44 Ennis Rd, MILSONS POINT 2061", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "STA" : Location(title: "State Transit Authority", address: "Level 4, 15 Bourke Road, MASCOT NSW 2020", start: nil, end: nil, image: nil, type: .Building, gps: nil),
    "SydneyTrains" : Location(title: "Sydney Trains", address: "477 Pitt St, HAYMARKET NSW 2008", start: nil, end: nil, image: nil, type: .Building, gps: nil),
]

var me = Person(
    name: "Ivan de Oliva",
    role: "Director, Transport Equip Centre of Excellence",
    team: "Equip COE",
    manager: "Ray Coury",
    mobile: "0466 330 227",
    email: "Ivan.Deoliva@transport.nsw.gov.au",
    image: #imageLiteral(resourceName: "ivan"),
    status: .AtDesk,
    home: myHome,
    defaultLocation: transportLocations["L25,477Pitt"],
    currLocation: transportLocations["L25,477Pitt"],
    nextLocation: transportLocations["L1,MacqPark"]
)

private let myHome = Location(title: "Home", address: "N/A", start: nil, end: nil, image: #imageLiteral(resourceName: "Home"), type: .Home, gps: nil)

private let parkHyatt = Location(
    title: "Park Hyatt Sydney", address: "7 Hickson Rd, Sydney New South Wales 2000, Australia",
    start: Date(), end: Date(timeIntervalSinceNow: secondsinDay),
    image: #imageLiteral(resourceName: "parkhyatt-sat"),
    type: .Home, gps: nil
)

private let travelling = Location(
    title: "Travelling", address: "n/a",
    start: Date(), end: Date(timeIntervalSinceNow: 3600.0),
    image: #imageLiteral(resourceName: "Travel"),
    type: .Other("travelling"), gps: nil
)

private let outOfOffice = Location(
    title: "Out of Office", address: "n/a",
    start: Date(), end: Date(timeIntervalSinceNow: 3600.0),
    image: #imageLiteral(resourceName: "OutOfOffice"),
    type: .Other("contactable via mobile"), gps: nil
)

private let abwPitt = Location(
    title: "Level 25",
    address: "477 Pitt Street\nHaymarket NSW 2008",
    start: nil, end: nil,
    image: #imageLiteral(resourceName: "L25Pitt"),
    type: .Desk,
    gps: nil
)

private let abwMacq = Location(
    title: "Level 1",
    address: "22 Giffnock Avenue\nMacquarie Park NSW 2113",
    start: nil, end: nil,
    image: #imageLiteral(resourceName: "L25Pitt"),
    type: .Desk,
    gps: nil
)

var myTeam = [
    Person(
        name: "Ray Coury",
        role: "Deputy Executive Director, Enterprise Applications",
        team: "Equip COE",
        manager: "Richard Host",
        mobile: "0412 558 454",
        email: "Ray.Coury@transport.nsw.gov.au",
        image: #imageLiteral(resourceName: "ray"),
        status: .InMeeting("Finance OPEX Review"),
        home: myHome,
        defaultLocation: transportLocations["L25,477Pitt"],
        currLocation: transportLocations["L6,Lee"],
        nextLocation: transportLocations["L1,MacqPark"]
    ),
    Person(
        name: "Himanshu Kshetrapal",
        role: "Business Engagement & Design Manager",
        team: "Equip COE",
        manager: "Ivan de Oliva",
        mobile: "0413 206 633",
        email: "Himanshu.Kshetrapal@transport.nsw.gov.au",
        image: #imageLiteral(resourceName: "himanshu"),
        status: .OutOfOffice,
        home: myHome,
        defaultLocation: transportLocations["L25,477Pitt"],
        currLocation: travelling,
        nextLocation: transportLocations["L1,MacqPark"]
    ),
    Person(
        name: "Steve O'Driscoll",
        role: "Portfolio Manager",
        team: "Equip COE",
        manager: "Ivan de Oliva",
        mobile: "0412 345 678",
        email: "Steven.O'Driscoll@transport.nsw.gov.au",
        image: #imageLiteral(resourceName: "steve"),
        status: .Leave,
        home: myHome,
        defaultLocation: transportLocations["L1,MacqPark"],
        currLocation: myHome,
        nextLocation: transportLocations["L1,MacqPark"]
    ),
    Person(
        name: "Ally Thorne",
        role: "Senior SAP Solution Architect Functional",
        team: "Equip COE",
        manager: "Ivan de Oliva",
        mobile: "0412 345 678",
        email: "Ally.Thorne@transport.nsw.gov.au",
        image: #imageLiteral(resourceName: "ally"),
        status: .Event("SAP User Group"),
        home: myHome,
        defaultLocation: transportLocations["L1,MacqPark"],
        currLocation: parkHyatt,
        nextLocation: transportLocations["L1,MacqPark"]
    ),
    Person(
        name: "Chris Tham",
        role: "Aerospace Designer",
        team: "Equip COE",
        manager: "Ivan de Oliva",
        mobile: "0413 008 577",
        email: "Chris.Tham@hellotham.com",
        image: #imageLiteral(resourceName: "chris"),
        status: .Other("Livin' the Dream"),
        home: myHome,
        defaultLocation: transportLocations["L25,477Pitt"],
        currLocation: myHome,
        nextLocation: myHome
    ),
]

var myActivities = [
    Activity(
        activity: "At Home",
        start: DateComponents(hour: 6),
        end: DateComponents(hour: 7),
        status: .Home,
        image: #imageLiteral(resourceName: "Home"),
        location: myHome
    ),
    Activity(
        activity: "Travelling",
        start: DateComponents(hour: 7),
        end: DateComponents(hour: 8),
        status: .Travel,
        image: #imageLiteral(resourceName: "Travel"),
        location: travelling
    ),
    Activity(
        activity: "ABW Desk #42",
        start: DateComponents(hour: 8),
        end: DateComponents(hour: 11),
        status: .AtDesk,
        image: #imageLiteral(resourceName: "ABW25Pitt"),
        location: abwPitt
    ),
    Activity(
        activity: "Meeting:",
        start: DateComponents(hour: 11),
        end: DateComponents(hour: 12),
        status: .InMeeting("Weekly Management meeting"),
        image: #imageLiteral(resourceName: "HunterPitt"),
        location: abwPitt
    ),
    Activity(
        activity: "Lunch and Travel",
        start: DateComponents(hour: 12),
        end: DateComponents(hour:14),
        status: .Travel,
        image: #imageLiteral(resourceName: "Travel"),
        location: travelling
    ),
    Activity(
        activity: "ABW Desk #1.032",
        start: DateComponents(hour: 14),
        end: DateComponents(hour:16),
        status: .AtDesk,
        image: #imageLiteral(resourceName: "ABWMacq"),
        location: abwMacq
    ),
    Activity(
        activity: "Out of Office",
        start: DateComponents(hour: 16),
        end: DateComponents(hour:18),
        status: .OutOfOffice,
        image: #imageLiteral(resourceName: "OutOfOffice"),
        location: outOfOffice
    )
]
