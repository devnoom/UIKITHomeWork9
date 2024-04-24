//
//  Country.swift
//  UIKITHomeWork9
//
//  Created by MacBook Air on 24.04.24.
//

import UIKit

struct Map: Codable {
    let googleMaps: String?
    let openStreetMaps: String?

    enum CodingKeys: String, CodingKey {
        case googleMaps = "googleMaps"
        case openStreetMaps = "openStreetMaps"
    }
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct postalCode: Codable {
    let format: String?
    let regex: String?
}

struct capitalInfo: Codable {
    let latlng: [Double]?
}

struct Name: Codable {
        let common: String?
        let official: String?
    }

struct countries: Codable {
    let name: Name?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let independent: Bool?
    let status: String?
    let capital: [String]?
    let maps: Map?
    let flags: Flags?
    let capitalInfo: capitalInfo?
    let postalCode: postalCode?
    
    
}
func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, let image = UIImage(data: data), error == nil else {
            completion(nil, error ?? NSError(domain: "Image loading error", code: -1, userInfo: nil))
            return
        }
        completion(image, nil)
    }.resume()
}

extension countries {
    
    public static func getArray() -> [countries]{
        return [
            countries(
                        name: Name(common: "CountryName", official: "OfficialCountryName"),
                        altSpellings: ["Alt1", "Alt2"],
                        region: "Region",
                        subregion: "Subregion",
                        independent: true,
                        status: "Status",
                        capital: ["Capital1", "Capital2"],
                        maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
                        flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
                        capitalInfo: UIKITHomeWork9.capitalInfo(latlng: [0.0, 0.0]),
                        postalCode: UIKITHomeWork9.postalCode(format: "Format", regex: "Regex")
                    ),
            countries(
                        name: Name(common: "CountryName", official: "OfficialCountryName"),
                        altSpellings: ["Alt1", "Alt2"],
                        region: "Region",
                        subregion: "Subregion",
                        independent: true,
                        status: "Status",
                        capital: ["Capital1", "Capital2"],
                        maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
                        flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
                        capitalInfo: UIKITHomeWork9.capitalInfo(latlng: [0.0, 0.0]),
                        postalCode: UIKITHomeWork9.postalCode(format: "Format", regex: "Regex")
                    ),
            countries(
                        name: Name(common: "CountryName", official: "OfficialCountryName"),
                        altSpellings: ["Alt1", "Alt2"],
                        region: "Region",
                        subregion: "Subregion",
                        independent: true,
                        status: "Status",
                        capital: ["Capital1", "Capital2"],
                        maps: Map(googleMaps: "GoogleMapsURL", openStreetMaps: "OpenStreetMapsURL"),
                        flags: Flags(png: "FlagPNGURL", svg: "FlagSVGURL", alt: "FlagAlt"),
                        capitalInfo: UIKITHomeWork9.capitalInfo(latlng: [0.0, 0.0]),
                        postalCode: UIKITHomeWork9.postalCode(format: "Format", regex: "Regex")
                    )
        ]
        
    }
}
