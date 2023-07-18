//
//  QuakeDetail.swift
//  Earthquakes-iOS
//
//  Created by Amante Castino on 6/21/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct QuakeDetail: View {
    let quake: Quake

    init(quake: Quake, onInit: () -> Void) {
        self.quake = quake
        onInit()
    }

    @EnvironmentObject private var quakesProvider: QuakesProvider
    @State private var location: QuakeLocation? = nil
    @State var isCoordFullPrecision = false

    var body: some View {
        VStack {
            if let location {
                QuakeDetailMap(location: location, tintColor: quake.color)
                    .ignoresSafeArea(.container)
            }
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted())")
                .foregroundColor(.secondary)
            if let location {
                VStack {
                    Text("Latitude: \(formatCoord(location.latitude, isPrecise: isCoordFullPrecision))")
                    Text("Longitude: \(formatCoord(location.longitude, isPrecise: isCoordFullPrecision))")
                }.onTapGesture {
                    withAnimation {
                        isCoordFullPrecision.toggle()
                    }
                }
            }
        }.task {
            if location == nil {
                if let quakeLocation = quake.location {
                    location = quakeLocation
                } else {
                    location = try? await quakesProvider.location(for: quake)
                }
            }
        }
    }

    func formatCoord(_ coord: Double, isPrecise: Bool) -> String {
        if isPrecise {
            return String(coord)
        }
        return coord.formatted(.number.precision(.fractionLength(3)))
    }
}

struct QuakeDetail_Previews: PreviewProvider {
    static var previews: some View {
        QuakeDetail(quake: Quake.preview, onInit: {})
    }
}
