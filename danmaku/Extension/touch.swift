	//
	//  touch.swift
	//  danmaku
	//
	//  Created by DifferThink on 6/26/22.
	//

import SwiftUI


extension View {
		/// A convenience method for applying `TouchDownUpEventModifier.`
	func onTouchDownUp(pressed: @escaping ((Bool) -> Void)) -> some View {
		self.modifier(TouchDownUpEventModifier(pressed: pressed))
	}
}

struct TouchDownUpEventModifier: ViewModifier {
		/// Keep track of the current dragging state. To avoid using `onChange`, we won't use `GestureState`
	@State var dragged = false
	
		/// A closure to call when the dragging state changes.
	var pressed: (Bool) -> Void
	func body(content: Content) -> some View {
		content
			.gesture(
				DragGesture(minimumDistance: 0)
					.onChanged { _ in
						if !dragged {
							dragged = true
							pressed(true)
						}
					}
					.onEnded { _ in
						dragged = false
						pressed(false)
					}
			)
	}
}


extension View {
	func onTouchDownGesture(callback: @escaping () -> Void) -> some View {
		modifier(OnTouchDownGestureModifier(callback: callback))
	}
}

private struct OnTouchDownGestureModifier: ViewModifier {
	@State private var tapped = false
	let callback: () -> Void
	
	func body(content: Content) -> some View {
		content
			.simultaneousGesture(DragGesture(minimumDistance: 0)
														.onChanged { _ in
				if !self.tapped {
					self.tapped = true
					self.callback()
				}
			}
														.onEnded { _ in
				self.tapped = false
			})
	}
}
