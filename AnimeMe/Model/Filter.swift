//
//  Filter.swift
//  AnimeMe
//
//  Created by macqoolelee on 2022/5/17.
//

import Foundation

class Filter: Hashable{
    
    var name: String = ""
    
    func hash(into hasher: inout Hasher) {
          hasher.combine(name)
    }
    
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        lhs.name == rhs.name
    }
    
    init(_ name: String){
        self.name = name
    }
    
}

