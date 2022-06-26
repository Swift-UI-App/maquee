import SwiftUI

struct RootView: View {
	@State private var hovered = false
	
		var body: some View {
			Text("שָׁ213213213大小לוֹם")
				.flipsForRightToLeftLayoutDirection(true)
				.font(.title)
	}
}

struct t_Previews: PreviewProvider {
	static var previews: some View {
		RootView()
	}
}
