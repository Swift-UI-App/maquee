	//
	//  ContentView.swift
	//  danmaku
	//
	//  Created by DifferThink on 6/25/22.
	//

import SwiftUI

struct ContentView: View {
	@State private var givenText: String = ""
	@State var showSetting: Bool = false
	@State var showInput: Bool = true
	@State var buttonPressed = false
	
	let settingData = SettingData()
	var white: Color = .white
		//	setting rotate forever
	@State private var isAnimating = false
	@State private var showProgress = false
	var foreverAnimation: Animation {
		Animation.linear(duration: 2.0)
			.repeatForever(autoreverses: false)
	}
	
	
	var body: some View {
			//		绑定输入框和弹幕
		let binding = Binding<String>(get: {
			self.givenText
		}, set: {
			self.givenText = $0
			settingData.defaultText = $0
		})
		
		ZStack {

			Maquee()
			Rectangle()
		//			透明填充绑定 touch 事件 值不能为0 否则绑定不了
				.fill(Color.white.opacity(0.01))
				.frame(width: SCWidth, height: 350, alignment: .top)
				.onTouchDownGesture {
					self.showInput.toggle()
					if (self.showSetting == true) {
						self.showSetting.toggle()
					}
					print("after touched value \(self.showInput)")
				}
			
			
			
			VStack {
				Spacer()
					// 控制是否显示Setting设置栏
				if (showSetting) {
					Setting()
				}
				if(showInput) {
					ScrollView(.horizontal) {
						HStack(spacing:0) {
							TextField(
								"请输入弹幕",
								text: binding
							)
								.textFieldStyle(RoundedBorderTextFieldStyle())
								.padding()
								.frame(width:SCWidth-40)
								//					Button
							Button(action: {
								self.showSetting.toggle()
							}, label: {
								Image(systemName: "gear.circle")
									.resizable()
									.frame(width: 32, height: 32)
									.foregroundColor(.black)
									.rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
									.animation(foreverAnimation)
									.onAppear { self.isAnimating = true }
									.onDisappear { self.isAnimating = false }
							})
							
						}
						.frame(height: 32)
					}
				}
			}
		}
		.environmentObject(settingData)
	}
}


struct Maquee: View {
	@State var ScrollText: Bool = false
	@EnvironmentObject var settingData: SettingData
	
	var body: some View {
					Rectangle().fill(settingData.backgroundColor)
						// 默认全方向忽略安全区域
						.ignoresSafeArea()
		Marquee {
			Text(settingData.defaultText)
				.fixedSize(horizontal: true, vertical: true)
				.rotationEffect(.degrees(90))
				.frame(width: SCWidth, height: SCHeight-200, alignment: .center)
				.font(.system(size: settingData.fontSize, weight:.bold, design: .monospaced))
				.lineLimit(1)
				.foregroundColor(settingData.fontColor)
		}
		.marqueeDuration(settingData.moveSpeed)
		
		
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		if #available(iOS 15.0, *) {
			ContentView()
				.previewInterfaceOrientation(.portrait)
		} else {
			ContentView().environmentObject(SettingData())
		}
	}
}
