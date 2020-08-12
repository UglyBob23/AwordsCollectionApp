//
//  RocketView.swift
//  AwordsCollectionApp
//
//  Created by Владимир Паутов on 12.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RocketView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let nearLine = size * 0.1
                    let farLine = size * 0.9
                    let middle = size / 2
                    
                    path.move(to: CGPoint(x: middle, y: nearLine))
                    path.addQuadCurve(to: CGPoint(x: farLine * 0.75, y: middle),
                                      control: CGPoint(x: farLine * 0.75, y: nearLine * 2))
                    path.addLine(to: CGPoint(x: farLine * 0.75, y: farLine * 0.8))
                    path.addLine(to: CGPoint(x: nearLine * 3.25, y: farLine * 0.8))
                    path.addLine(to: CGPoint(x: nearLine * 3.25, y: middle))
                    path.addQuadCurve(to: CGPoint(x: middle, y: nearLine),
                                      control: CGPoint(x: nearLine * 3.25, y: nearLine * 2))
                }
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.white, .gray]),
                                   startPoint: UnitPoint(x: 1, y: 0.5),
                                   endPoint: UnitPoint(x: 0, y: 0.5))
                )
                
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let nearLine = size * 0.1
                    let farLine = size * 0.9
                    
                    path.move(to: CGPoint(x: nearLine * 3.25, y: farLine * 0.6))
                    path.addLine(to: CGPoint(x: nearLine * 3.25, y: farLine * 0.8))
                    path.addQuadCurve(to: CGPoint(x: nearLine * 2 , y: farLine),
                                      control: CGPoint(x: nearLine * 2, y: farLine * 0.9 ))
                    path.addQuadCurve(to: CGPoint(x: nearLine * 3.25, y: farLine * 0.6),
                                      control: CGPoint(x: nearLine * 2, y: farLine * 0.8))
                    path.move(to: CGPoint(x: farLine * 0.75, y: farLine * 0.6))
                    path.addLine(to: CGPoint(x: farLine * 0.75, y: farLine * 0.8))
                    path.addQuadCurve(to: CGPoint(x: farLine - nearLine, y: farLine),
                                      control: CGPoint(x: farLine - nearLine, y: farLine * 0.9 ))
                    path.addQuadCurve(to: CGPoint(x: farLine * 0.75, y: farLine * 0.6),
                                      control: CGPoint(x: farLine - nearLine, y: farLine * 0.8))
                }
                .fill(Color.red)
                
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let farLine = size * 0.9
                    let middle = size / 2
                    
                    path.move(to: CGPoint(x: middle, y: farLine * 0.6))
                    path.addQuadCurve(to: CGPoint(x: middle, y: farLine),
                                      control: CGPoint(x: middle * 0.9, y: farLine * 0.8))
                    path.addQuadCurve(to: CGPoint(x: middle, y: farLine * 0.6),
                                      control: CGPoint(x: middle * 1.1, y: farLine * 0.8 ))
                }
                .fill(Color.red)
                
                Path { path in
                    let size = min(geometry.size.width, geometry.size.height)
                    let nearLine = size * 0.1
                    let middle = size / 2
                    
                    path.addArc(
                        center: CGPoint(x: middle, y: middle - nearLine),
                        radius: nearLine,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true
                    )
                }
            }
        }
    }
}

struct RocketView_Previews: PreviewProvider {
    static var previews: some View {
        RocketView()
            .frame(width: 200, height: 200)
    }
}
