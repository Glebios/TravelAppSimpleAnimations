//
//  Onboardingitem.swift
//  TravelApp
//
//  Created by Gleb on 12.11.2020.
//

import Foundation
import UIKit

struct OnboardingItems {
    let title: String
    let details:String
    let bgImage: UIImage?
    
    
    
    static let placeholderItems: [OnboardingItems] = [
        .init(title: "Travel Your Way", details: "Travel the world by air, rail or sea at the most compettitive prices ", bgImage: #imageLiteral(resourceName: "imTravel1")),
        .init(title: "Stay Your Way", details: "With over millions of hoetls worldwide, find the perfect accomodation in the most amazing places!", bgImage: #imageLiteral(resourceName: "imTravel3")),
        .init(title: "Discover Your Way With New Features", details: "Explore exotic destination with our new features that like you to like-minded travellers.", bgImage: #imageLiteral(resourceName: "imTravel2")),
        .init(title: "Feast Your Way", details: "We recommended you local cuisines that are safe and higly recommended by the locals!", bgImage: #imageLiteral(resourceName: "imTravel4"))
    ]
}
