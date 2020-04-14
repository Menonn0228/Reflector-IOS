//
//  ArticleListViewModel.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/13/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


/// This is the ViewModel for the ArticleListView
class ArticleListViewModel: ObservableObject {
    @Published var title: String = "The Reflector"
    @Published var date: String = "Feb 04. 2020"
//    @Published var article: [Article]

}
