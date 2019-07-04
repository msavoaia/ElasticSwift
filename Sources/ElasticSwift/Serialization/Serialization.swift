//
//  Serialization.swift
//  ElasticSwift
//
//  Created by Prafull Kumar Soni on 6/5/17.
//
//

import Foundation

public protocol Serializer {
    
    func decode<T: Codable>(data: Data) throws -> T?
    
    func encode<T: Codable>(_ value: T) throws -> Data?
    
}

public class DefaultSerializer: Serializer {
    
    public let encoder: JSONEncoder
    public let decoder: JSONDecoder
    
    public init() {
        self.encoder = JSONEncoder()
        self.decoder = JSONDecoder()
    }
    
    public func decode<T: Codable>(data: Data) throws -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
    public func encode<T: Codable>(_ value: T) throws -> Data? {
        do {
            return try encoder.encode(value)
        } catch {
            throw error
        }
    }
}
