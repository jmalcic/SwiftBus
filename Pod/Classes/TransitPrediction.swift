//
//  TransitPrediction.swift
//  SwiftBus
//
//  Created by Adam on 2015-09-01.
//  Copyright (c) 2015 Adam Boyd. All rights reserved.
//

import Foundation

private let numberOfVehiclesEncoderString = "kNumberOfVehiclesEncoder"
private let predictionInMinutesEncoderString = "kPredictionInMinutesEncoder"
private let predictionInSecondsEncoderString = "kPredictionInSecondsEncoder"
private let vehicleTagEncoderString = "kVehicleTagEncoder"

open class TransitPrediction: NSObject, NSCoding {
    
    open var numberOfVehicles:Int = 0
    open var predictionInMinutes:Int = 0
    open var predictionInSeconds:Int = 0
    open var vehicleTag:Int = 0
    
    //Basic init
    public override init() { super.init() }
    
    //Init with only # of minutes
    public init(predictionInMinutes:Int) {
        self.predictionInMinutes = predictionInMinutes
        self.predictionInSeconds = self.predictionInMinutes * 60
    }
    
    //Init with all parameters except number of vehicles
    public init(predictionInMinutes:Int, predictionInSeconds:Int, vehicleTag:Int) {
        self.predictionInMinutes = predictionInMinutes
        self.predictionInSeconds = predictionInSeconds
        self.vehicleTag = vehicleTag
    }
    
    //MARK : NSCoding
    public required init(coder aDecoder: NSCoder) {
        numberOfVehicles = aDecoder.decodeObject(forKey: numberOfVehiclesEncoderString) as! Int
        predictionInMinutes = aDecoder.decodeObject(forKey: predictionInMinutesEncoderString) as! Int
        predictionInSeconds = aDecoder.decodeObject(forKey: predictionInSecondsEncoderString) as! Int
        vehicleTag = aDecoder.decodeObject(forKey: vehicleTagEncoderString) as! Int
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(numberOfVehicles, forKey: numberOfVehiclesEncoderString)
        aCoder.encode(predictionInMinutes, forKey: predictionInMinutesEncoderString)
        aCoder.encode(predictionInSeconds, forKey: predictionInSecondsEncoderString)
        aCoder.encode(vehicleTag, forKey: vehicleTagEncoderString)
    }
    
}
