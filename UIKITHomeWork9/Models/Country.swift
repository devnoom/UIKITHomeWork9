import UIKit

struct Map: Codable {
    let googleMaps: String?
    let openStreetMaps: String?

    enum CodingKeys: String, CodingKey {
        case googleMaps
        case openStreetMaps
    }
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct PostalCode: Codable {
    let format: String?
    let regex: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

struct Name: Codable {
    let common: String?
    let official: String?
}

struct Country: Codable {
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
}
