//
//  SnapshotUtils.swift
//  CurrencyConverterTests
//
//  Created by Antonio Rodrigues on 3/2/19.
//  Copyright © 2019 Antonio Rodrigues. All rights reserved.
//

import Nimble
import FBSnapshotTestCase

@testable import CurrencyConverter

import Nimble_Snapshots

func matchSnapshot(named name: String,
                   record: Bool = false) -> Predicate<Snapshotable> {
    
    if record {
        return recordSnapshot(named: name)
    } else {
        return haveValidSnapshot(named: name, tolerance: 0)
    }
    
}
