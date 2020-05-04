//
//  String+isBlank.swift
//  habitual
//
//  Created by Anika Morris on 5/4/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

extension String {
  var isBlank: Bool {
    return allSatisfy({ $0.isWhitespace })
  }
}
