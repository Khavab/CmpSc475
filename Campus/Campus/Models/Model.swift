//
//  Model.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import Foundation

struct Building: Identifiable, Decodable {
    let id: Int
    let latitude: Float
    let longitude: Float
    let name: String
    let code: Int
    let year: Int
    var mapped: Bool
    var favorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case name
        case code = "opp_bldg_code"
        case year = "year_constructed"
        case mapped
        case favorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try container.decode(Float.self, forKey: .latitude)
        longitude = try container.decode(Float.self, forKey: .longitude)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode(Int.self, forKey: .code)
        year = try container.decodeIfPresent(Int.self, forKey: .year) ?? 0
        mapped = try container.decodeIfPresent(Bool.self, forKey: .mapped) ?? false
        favorite = try container.decodeIfPresent(Bool.self, forKey: .favorite) ?? false
        id = code
    }
}
