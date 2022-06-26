//
//  settings.swift
//  danmaku
//
//  Created by DifferThink on 6/25/22.
//

import Foundation
import SwiftUI

class SettingData: ObservableObject,Identifiable {
	@Published var fontSize: CGFloat = 100
	@Published var moveSpeed: Double = 0.0
	@Published var fontColor: Color = Color(white: 0.8745)
//	@Published var fontColorPicker: Color = .orange
//	@Published var bgColorPicker: Color = .accentColor
	@Published var backgroundColor: Color = .purple
	@Published var defaultText: String = "请输入弹幕"
	@Published var colorSetList: [Color] = [Color(white: 0.8745), Color.black, Color.pink, Color.accentColor, Color.yellow, Color.purple, Color.pink]
}


// 设备高度、和宽度
let SCWidth = UIScreen.main.bounds.width
let SCHeight = UIScreen.main.bounds.height
