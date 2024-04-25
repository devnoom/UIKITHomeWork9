import UIKit

struct Map: Decodable {
    let googleMaps: String?
    let openStreetMaps: String?

    enum CodingKeys: String, CodingKey {
        case googleMaps
        case openStreetMaps
    }
}

struct Flags: Decodable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct PostalCode: Decodable {
    let format: String?
    let regex: String?
}

struct CapitalInfo: Decodable {
    let latlng: [Double]?
}

struct Name: Decodable {
    let common: String?
    let official: String?
}

struct Countries: Decodable {
    let name: Name?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let independent: Bool?
    let status: String?
    let capital: [String]?
    let maps: Map?
    let flags: Flags?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
    
    enum CodingKeys: String, CodingKey {
        case name
        case altSpellings
        case region
        case subregion
        case independent
        case status
        case capital
        case maps
        case flags
        case capitalInfo
        case postalCode
    }
    
    var flagURL: URL? {
        return URL(string:
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FFlag_of_Georgia_%2528country%2529&psig=AOvVaw3Yes7GblYD02IhVFjb0RnW&ust=1714118277677000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJiT5qjy3IUDFQAAAAAdAAAAABAE")
    }
    
    
    
    
}
