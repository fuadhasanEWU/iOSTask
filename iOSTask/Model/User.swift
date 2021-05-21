//
//  User.swift
//  iOSTask
//
//  Created by Fuad Hasan on 21/5/21.
//

import Foundation


struct Results:Decodable {
    let results:[User]
}

struct User : Decodable {
    let name:Name
    let email:String?
    let location:Location?
    let cell:String?
    let phone:String?

}

struct Name:Decodable {
    
    let title:String?
    let first:String?
    let last:String?
}

struct Location :Decodable {
    
    let country:String?
    let city:String?
    let state:String?
    let street:Street?
    
}

struct Street:Decodable {
    let number:Double?
    let name:String?
}

//
//"gender": "male",
//"name": {
//  "title": "Mr",
//  "first": "Magnus",
//  "last": "Madland"
//},
//"location": {
//  "street": {
//    "number": 2509,
//    "name": "Lille Stranden"
//  },
//  "city": "Tveitsund",
//  "state": "Bergen",
//  "country": "Norway",
//  "postcode": "3086",
//  "coordinates": {
//    "latitude": "57.6461",
//    "longitude": "-50.3187"
//  },
//  "timezone": {
//    "offset": "0:00",
//    "description": "Western Europe Time, London, Lisbon, Casablanca"
//  }
//},
//"email": "magnus.madland@example.com",
//"login": {
//  "uuid": "98748e10-1f48-4e84-bf5f-cdaa4ee2bfc8",
//  "username": "greenzebra802",
//  "password": "volcom",
//  "salt": "h8rF5FsC",
//  "md5": "4a4ebc3576db4f631e4beacb0d3f8fd9",
//  "sha1": "ad258fe11a230d9bb8b7d760ab51cf4d70882c15",
//  "sha256": "d6c71050c7557efb64809b290d4100e8283d9cda87610df35262bbe9aae1b19b"
//},
//"dob": {
//  "date": "1989-07-13T20:08:49.046Z",
//  "age": 32
//},
//"registered": {
//  "date": "2014-03-04T05:46:43.742Z",
//  "age": 7
//},
//"phone": "38916975",
//"cell": "97286707",
//"id": {
//  "name": "FN",
//  "value": "13078947556"
//},
//"picture": {
//  "large": "https://randomuser.me/api/portraits/men/63.jpg",
//  "medium": "https://randomuser.me/api/portraits/med/men/63.jpg",
//  "thumbnail": "https://randomuser.me/api/portraits/thumb/men/63.jpg"
//},
//"nat": "NO"
//
