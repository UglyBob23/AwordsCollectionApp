//
//  ShapesView.swift
//  AwordsCollectionApp
//
//  Created by Alexey Efimov on 05.08.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ShapesView: View {
    let awards = Award.getAwards()
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }
    var body: some View {
        NavigationView {
            GridView(items: activeAwards, columns: 2) { itemSize, award in
                VStack() {
                    award.awardView
                    Text(award.title)
                }
                    .padding(.horizontal)// При добавлении вертикального отступа текст смещается относительно awardView(не смог победить)
                    .frame(width: itemSize, height: itemSize)
            }
            .navigationBarTitle("Your awards: \(activeAwards.count)")
        }
        
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
