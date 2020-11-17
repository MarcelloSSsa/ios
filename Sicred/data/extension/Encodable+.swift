//
//  Encodable+.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
      let data = try? JSONEncoder().encode(self)
      guard let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
        fatalError("Cannot make dictionary out of \(self)")
      }
      return dictionary
    }
}
