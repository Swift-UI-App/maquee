	//
	//  ColorButton.swift
	//  danmaku
	//
	//  Created by DifferThink on 6/25/22.
	//

import SwiftUI

struct FontColorButton: View {
	@Binding var appColor: Color
	@EnvironmentObject var settingData: SettingData
	var body: some View {
		Button {
			print("\(appColor) was taped, before \(settingData.fontColor)")
			settingData.fontColor = appColor
			print("\(settingData.fontColor) was changed")
		} label: {
			Image(systemName: "app.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 40, height: 40)
				.foregroundColor(appColor)
				.overlay(
					RoundedRectangle(cornerRadius: 7)
						.stroke(Color.white, lineWidth: 3)
				)
		}
	}
}


struct BGColorButton: View {
	@Binding var appColor: Color
	@EnvironmentObject var settingData: SettingData
	var body: some View {
		Button {
			print("\(appColor) was taped, before \(settingData.backgroundColor)")
			settingData.backgroundColor = appColor
			print("\(settingData.backgroundColor) was changed")
		} label: {
			Image(systemName: "app.fill")
				.resizable()
				.scaledToFit()
				.frame(width: 40, height: 40)
				.foregroundColor(appColor)
				.overlay(
					RoundedRectangle(cornerRadius: 7)
						.stroke(Color.white, lineWidth: 3)
				)
		}
	}
}

struct ColorButton_Previews: PreviewProvider {
	static var previews: some View {
		FontColorButton(appColor: .constant(Color.gray))
	}
}
