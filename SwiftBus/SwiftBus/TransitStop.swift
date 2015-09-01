//
//  TransitStop.swift
//  SwiftBus
//
//  Created by Adam on 2015-08-29.
//  Copyright (c) 2015 com.adam. All rights reserved.
//

import Foundation

private let kRouteTitleEncoderString = "kRouteTitleEncoder"
private let kRouteTagEncoderString = "kRouteTagEncoder"
private let kStopTitleEncoderString = "kStopTitleEncoder"
private let kStopTagEncoderString = "kStopTagEncoder"
private let kDirectionEncoderString = "kDirectionEncoder"
private let kLatEncoderString = "kLatEncoder"
private let kLonEncoderString = "kLonEncoder"
private let kPredictionsEncoderString = "kPredictionsEncoder"

//Stored stop identifiers to get the data from
class TransitStop:NSObject, NSCoding {
    var routeTitle:String = ""
    var routeTag:String = ""
    var stopTitle:String = ""
    var stopTag:String = ""
    var direction:String = ""
    var lat:Double = 0
    var lon:Double = 0
    var predictions:[String : [Int]] = [:]
    
    //Init without predictions or direction
    init(routeTitle:String, routeTag:String, stopTitle:String, stopTag:String) {
        self.routeTitle = routeTitle
        self.routeTag = routeTag
        self.stopTitle = stopTitle
        self.stopTag = stopTag
    }
    
    /**
    Returns a list of all the predictions from the different directions in order
    
    :returns: In order list of all predictions from all different directions
    */
    func combinedPredictions() -> [Int] {
        var listOfPredictions:[Int] = []
        
        for predictionDirection in predictions.values.array {
            //Going through each direction
            listOfPredictions += predictionDirection
        }
        
        //Sorting the list
        listOfPredictions.sort {
            return $0 < $1
        }
        
        return listOfPredictions
    }
    
    //MARK: NSCoding
    
    required init(coder aDecoder: NSCoder) {
        routeTitle = aDecoder.decodeObjectForKey(kRouteTitleEncoderString) as! String
        routeTag = aDecoder.decodeObjectForKey(kRouteTagEncoderString) as! String
        stopTitle = aDecoder.decodeObjectForKey(kStopTitleEncoderString) as! String
        stopTag = aDecoder.decodeObjectForKey(kStopTagEncoderString) as! String
        direction = aDecoder.decodeObjectForKey(kDirectionEncoderString) as! String
        lat = aDecoder.decodeDoubleForKey(kLatEncoderString)
        lon = aDecoder.decodeDoubleForKey(kLonEncoderString)
        predictions = aDecoder.decodeObjectForKey(kPredictionsEncoderString) as! [String:[Int]]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(routeTitle, forKey: kRouteTitleEncoderString)
        aCoder.encodeObject(routeTag, forKey: kRouteTagEncoderString)
        aCoder.encodeObject(stopTitle, forKey: kStopTitleEncoderString)
        aCoder.encodeObject(stopTag, forKey: kStopTagEncoderString)
        aCoder.encodeObject(direction, forKey: kDirectionEncoderString)
        aCoder.encodeDouble(lat, forKey: kLatEncoderString)
        aCoder.encodeDouble(lon, forKey: kLonEncoderString)
        aCoder.encodeObject(predictions, forKey: kPredictionsEncoderString)
    }
}