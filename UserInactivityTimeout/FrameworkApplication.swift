//
//  FrameworkApplication.swift
//  UserInactivityTimeout
//
//  Created by Ingrid Silapan on 27/08/18.
//  Copyright © 2018 irs. All rights reserved.
//

import UIKit

///See main.swift on how this UIApplication subclass is specified as the class to use when launching the application

class FrameworkApplication: UIApplication {
	
	private var timeoutInSeconds: TimeInterval {
		return 120
	}
	
	private var idleTimer: Timer?
	
	private func resetIdleTimer() {
		
		//TODO: Other things to consider - only do this when the user is logged in
		print("Resetting Idle Timer...")
		
		if let idleTimer = idleTimer {
			idleTimer.invalidate()
		}
		
		idleTimer = Timer.scheduledTimer(timeInterval: timeoutInSeconds, target: self, selector: #selector(FrameworkApplication.applicationHasTimedOut), userInfo: nil, repeats: false)
		
	}
	
	@objc private func applicationHasTimedOut() {
		//When the application has timed out, send out the notification and register an observer to this notification wherever/whenever applicable to the use case
		NotificationCenter.default.post(name: .appTimeout, object: nil)
	}
	
	override func sendEvent(_ event: UIEvent) {
		super.sendEvent(event)
		
		if idleTimer != nil {
			self.resetIdleTimer()
		}
		
		if let touches = event.allTouches {
			
			for touch in touches {
				if touch.phase == UITouchPhase.ended {
					self.resetIdleTimer()
				}
			}
		}
	}
	
	
}


