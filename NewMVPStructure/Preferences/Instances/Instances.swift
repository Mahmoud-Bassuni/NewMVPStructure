//
//  Instances.swift
//  NewMVPStructure
//
//  Created by Mahmoud Basyouny on 3/27/20.
//  Copyright © 2020 Mahmoud Basyouny. All rights reserved.
//

import Foundation

class Instances {
    static var shared = Instances()

    private var ipInstance : IpInstance?

    private init() {}

    func ip() -> IpInstance {
        if (ipInstance == nil) {
            ipInstance = IpInstance()
        }
        return ipInstance!
    }

    func clear() {
        Instances.shared = Instances()
    }
}
