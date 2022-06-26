	//
	//  Setting.swift
	//  danmaku
	//
	//  Created by DifferThink on 6/25/22.
	//

import SwiftUI

struct Setting: View {
	@EnvironmentObject var settingData: SettingData
	@State private var color = Color.red
	var body: some View {
		VStack {
			HStack {
				Text("字号:")
					.font(.headline)
				Slider(value: $settingData.fontSize, in: 20.0...SCWidth, step: 3)
			}
			
			HStack {
				Text("速度:")
					.font(.headline)
				
				Slider(value: $settingData.moveSpeed, in: 0.0...10.0, step: 1)
			}
			
			ScrollView(.horizontal) {
				HStack(spacing: 4) {
					Text("颜色:")
						.font(.headline)
					ForEach(0..<settingData.colorSetList.count) { i in
						let color = settingData.colorSetList[i]
						FontColorButton(appColor: .constant(color))
					}
					SquareColorPicker()
					
				}
			}
			
			ScrollView(.horizontal) {
				HStack(spacing: 4) {
					Text("背景:")
						.font(.headline)
					ForEach(0..<settingData.colorSetList.count) { i in
						let color = settingData.colorSetList[i]
						BGColorButton(appColor: .constant(color))
					}
					BgSquareColorPicker()
				}
			}
			
		}
		.padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
	}
}

struct Setting_Previews: PreviewProvider {
	static var previews: some View {
		Setting().environmentObject(SettingData())
	}
}
