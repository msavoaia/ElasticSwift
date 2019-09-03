//
//  Query.swift
//  ElasticSwift
//
//  Created by Prafull Kumar Soni on 6/3/17.
//
//

import Foundation

//MARK:- Query Protocol

/// Protocol that all `Query` conforms to
public protocol Query: Encodable {
    
    var name: String { get }
    
    func toDic() -> [String: Any]
}

/// Protocol that all Builder for `Query` conforms to
public protocol QueryBuilder {
    
    associatedtype QueryType: Query
    
    func build() throws -> QueryType

}

public struct DynamicCodingKeys: CodingKey {
    public var stringValue: String
    
    public init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    public var intValue: Int?
    
    public init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = String(intValue)
    }
    
    public static func key(named name: String) -> DynamicCodingKeys {
        return DynamicCodingKeys(stringValue: name)!
    }
    
    public static func key(indexed index: Int) -> DynamicCodingKeys {
        return DynamicCodingKeys(intValue: index)!
    }
    
}
