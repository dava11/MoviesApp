//
//  File.swift
//  MoviesApp
//
//  Created by David Khachidze on 31.08.2022.
//

import Foundation

struct MoviesModel: Equatable {
    
    var name: String
    var year: Int
    
    static func == (lmm: MoviesModel, rmm: MoviesModel) -> Bool {
        return lmm.name == rmm.name && lmm.year == rmm.year
    }
   
}
