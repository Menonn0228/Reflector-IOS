//
//  XMLHelper.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/7/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI

class XMLHelper: NSObject, XMLParserDelegate {
    private var articles: [Article] = []
    private var article: Article!
    private var currentContent: String = String()
    
    enum XMLHelperError: Error {
        case invalidDataInput
    }
    
    enum tags: String {
        case item = "item"
        case title = "title"
        case description = "description"
        case pubDate = "pubDate"
        case link = "link"
        case creator = "dc: creator"
    }
    
    public var data: Data!
    
    public func parse<T>(_ resultType: T.Type, data: Data) -> [T] {
        let results: [T] = []
        let parser = XMLParser(data: data)
        parser.delegate = self
        self.articles = []
        self.article = Article()
        
        if !parser.parse() {
            print("Data Errors exist in XML. could not parse.")
        }
        return results
    }
    
    
    // MARK: - XMLParser Delegate Methods
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Starting to Parse")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "item" {
            article = Article()
        }
        self.currentContent = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentContent += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
            
        case tags.item.rawValue:
            articles.append(article)
            break
        case tags.title.rawValue:
            article.title = currentContent
            break
        case tags.description.rawValue:
            article.description = currentContent
            break
        case tags.pubDate.rawValue:
            article.pubDate = currentContent
            break
        case tags.link.rawValue:
            article.link = currentContent
            break
        case tags.creator.rawValue:
            article.creator = currentContent
            break
            
        default: return
        }
    }
    
    
    
    
    
}
