//
//  main.swift
//  UserInactivityTimeout
//
//  Created by Ingrid Silapan on 27/08/18.
//  Copyright © 2018 irs. All rights reserved.
//

import UIKit

/** A main.swift file is necessary so we can use the subclassed Application class
	When doing this, also remove the @UIApplicationMain from the AppDelegate so it would use this instead.
*/


UIApplicationMain(CommandLine.argc,
				  UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)), NSStringFromClass(FrameworkApplication.self), NSStringFromClass(AppDelegate.self))
