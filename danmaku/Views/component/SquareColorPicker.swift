	//
	//  ColorPicker.swift
	//  danmaku
	//
	//  Created by DifferThink on 6/25/22.
	//

import SwiftUI

struct SquareColorPicker: View {
	@EnvironmentObject var settingData: SettingData
	var colorValue: Color {
		get {
			return settingData.fontColor
		}
		set {
			settingData.fontColor = newValue
		}
	}
	var body: some View {
		colorValue
			.frame(width: 28, height: 28, alignment: .center)
			.cornerRadius(5.0)
			.overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, style: StrokeStyle(lineWidth: 5)))
			.padding(12)
			.background(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.pink]), center:.center).cornerRadius(10.0))
			.overlay(ColorPicker("", selection: $settingData.fontColor).labelsHidden().opacity(0.015))
			.shadow(radius: 5.0)
	}
}


struct BgSquareColorPicker: View {
	@EnvironmentObject var settingData: SettingData
	var colorValue: Color {
		get {
			return settingData.backgroundColor
		}
		set {
			settingData.backgroundColor = newValue
		}
	}
	var body: some View {
		colorValue
			.frame(width: 28, height: 28, alignment: .center)
			.cornerRadius(5.0)
			.overlay(RoundedRectangle(cornerRadius: 5.0).stroke(Color.white, style: StrokeStyle(lineWidth: 5)))
			.padding(12)
			.background(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.pink]), center:.center).cornerRadius(10.0))
			.overlay(ColorPicker("", selection: $settingData.backgroundColor).labelsHidden().opacity(0.015))
			.shadow(radius: 5.0)
	}
}

struct ColorPicker_Previews: PreviewProvider {
	static var previews: some View {
		SquareColorPicker().environmentObject(SettingData())
	}
}
