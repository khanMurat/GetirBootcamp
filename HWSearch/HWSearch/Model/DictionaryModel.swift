//
//  DictionaryModel.swift
//  HWSearch
//
//  Created by Murat on 18.03.2024.
//

import Foundation

struct WordDefinition: Codable {
    let word: String
    let phonetic: String?
    let phonetics: [Phonetic]
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String
    let audio: String?
    let sourceUrl: URL?
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms: [String]
    let antonyms: [String]
}

struct Definition: Codable {
    let definition: String
    let synonyms: [String]?
    let antonyms: [String]?
}

