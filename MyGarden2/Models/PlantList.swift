//
//  PlantList.swift
//  MyGarden2
//
//  Created by Reema Alhabdan on 11/01/2023.
//
import SwiftUI
import Foundation
import RealmSwift

class PlantList: Object, Identifiable{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var PlantName: String
    @Persisted var Schedule: String
    @Persisted var WateringDay: String
    @Persisted var PlantCategory: String
    
    
    override class func primaryKey() -> String? {
        "id"
    }
}
