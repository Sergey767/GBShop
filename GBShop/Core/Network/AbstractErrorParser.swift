//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Сергей Горячев on 14.08.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
