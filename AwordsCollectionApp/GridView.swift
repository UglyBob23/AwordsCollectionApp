//
//  GridView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 10.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct GridView<Content, T>: View where Content: View {
    var items: [T]
    var columns: Int
    var rows: Int {
        items.count / columns
    }
    
    let content: (CGFloat, T) -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(0...self.rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<self.columns) { columnsIndex in
                                Group {
                                    if self.elementFor(row: rowIndex, and: columnsIndex) != nil {
                                        self.content(
                                            geometry.size.width / CGFloat(self.columns),
                                            self.items[self.elementFor(row: rowIndex, and: columnsIndex)!]
                                        )
                                        
                                    } else {
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension GridView {
    private func elementFor(row: Int, and colomn: Int) -> Int? {
        let index = row * columns + colomn
        return index < items.count ? index : nil
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(items: [25, 36, 4, 87, 32, 82], columns: 3) { itemSize, item in
            Text("\(item)")
                .frame(width: itemSize, height: itemSize)
        }
    }
}
