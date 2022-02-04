//
//  RealmService.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 10.12.2021.
//

import Foundation
import RealmSwift

protocol AnyRealmService {
    func save<T: Object>(items: [T], configuration: Realm.Configuration, update: Realm.UpdatePolicy) throws
    func get<T: Object>(_ type: T.Type, configuration: Realm.Configuration) throws -> Results<T>
    func get<T: Object>(_ type: T.Type, configuration: Realm.Configuration) throws -> [T]
    func delete<T: Object>(object: T, configuration: Realm.Configuration) throws
}

class RealmService: AnyRealmService {
    func save<T: Object>(
        items: [T],
        configuration: Realm.Configuration = .deleteIfMigration,
        update: Realm.UpdatePolicy = .modified
    ) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
    
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws -> Results<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type)
    }
    
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws -> Array<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type).map { $0.detached() }
    }
    
    func delete<T: Object>(
        object: T,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        try realm.write {
            realm.delete(object)
        }
    }
}

extension Realm.Configuration {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
}

protocol DetachableObject: AnyObject {
    func detached() -> Self
}

extension Object: DetachableObject {
    func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else {
                continue
            }
            if let detachable = value as? DetachableObject {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else {
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}

extension List: DetachableObject {
    func detached() -> List<Element> {
        let result = List<Element>()
        forEach {
            if let detachableObject = $0 as? DetachableObject,
                let element = detachableObject.detached() as? Element {
                result.append(element)
            } else { // Then it is a primitive
                result.append($0)
            }
        }
        return result
    }
}
