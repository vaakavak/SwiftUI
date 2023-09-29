//
//  MissionView.swift
//  Moonshot
//
//  Created by Евгений Шилов on 29.09.2023.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    var body: some View {
        GeometryReader(content: { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        
                    }
                    .padding(.horizontal )
                }
                .padding(.bottom)
            }
        })
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    
    MissionView(mission: mission[0])
               .preferredColorScheme(.dark)
}
