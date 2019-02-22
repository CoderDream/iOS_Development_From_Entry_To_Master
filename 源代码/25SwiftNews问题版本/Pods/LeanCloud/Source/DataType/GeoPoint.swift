//
//  LCGeoPoint.swift
//  LeanCloud
//
//  Created by Tang Tianyong on 4/1/16.
//  Copyright © 2016 LeanCloud. All rights reserved.
//

import Foundation

/**
 LeanCloud geography point type.

 This type can be used to represent a 2D location with latitude and longitude.
 */
public final class LCGeoPoint: NSObject, LCType, LCTypeExtension {
    public private(set) var latitude: Double = 0
    public private(set) var longitude: Double = 0

    public enum Unit: String {
        case Mile = "Miles"
        case Kilometer = "Kilometers"
        case Radian = "Radians"
    }

    public struct Distance {
        let value: Double
        let unit: Unit

        public init(value: Double, unit: Unit) {
            self.value = value
            self.unit  = unit
        }
    }

    public override init() {
        super.init()
    }

    public convenience init(latitude: Double, longitude: Double) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }

    init?(dictionary: [String: AnyObject]) {
        guard let type = dictionary["__type"] as? String else {
            return nil
        }
        guard let dataType = RESTClient.DataType(rawValue: type) else {
            return nil
        }
        guard case dataType = RESTClient.DataType.GeoPoint else {
            return nil
        }
        guard let latitude = dictionary["latitude"] as? Double else {
            return nil
        }
        guard let longitude = dictionary["longitude"] as? Double else {
            return nil
        }

        self.latitude  = latitude
        self.longitude = longitude
    }

    public required init?(coder aDecoder: NSCoder) {
        latitude  = aDecoder.decodeDoubleForKey("latitude")
        longitude = aDecoder.decodeDoubleForKey("longitude")
    }

    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDouble(latitude, forKey: "latitude")
        aCoder.encodeDouble(longitude, forKey: "longitude")
    }

    public func copyWithZone(zone: NSZone) -> AnyObject {
        return LCGeoPoint(latitude: latitude, longitude: longitude)
    }

    public override func isEqual(another: AnyObject?) -> Bool {
        if another === self {
            return true
        } else if let another = another as? LCGeoPoint {
            return another.latitude == latitude && another.longitude == longitude
        } else {
            return false
        }
    }

    public var JSONValue: AnyObject {
        return [
            "__type"    : "GeoPoint",
            "latitude"  : latitude,
            "longitude" : longitude
        ]
    }

    public var JSONString: String {
        return ObjectProfiler.getJSONString(self)
    }

    var LCONValue: AnyObject? {
        return JSONValue
    }

    static func instance() -> LCType {
        return self.init()
    }

    func forEachChild(body: (child: LCType) -> Void) {
        /* Nothing to do. */
    }

    func add(other: LCType) throws -> LCType {
        throw LCError(code: .InvalidType, reason: "Object cannot be added.")
    }

    func concatenate(other: LCType, unique: Bool) throws -> LCType {
        throw LCError(code: .InvalidType, reason: "Object cannot be concatenated.")
    }

    func differ(other: LCType) throws -> LCType {
        throw LCError(code: .InvalidType, reason: "Object cannot be differed.")
    }
}