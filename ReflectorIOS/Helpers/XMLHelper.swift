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
    private var articles: [Article]
    private var article: Article!
    private var currentContent: String = String()
    
    enum XMLHelperError: Error {
        case invalidDataInput
    }
    
    public var data: Data!
    
    // MARK: - Init Method
    override required init() {
        self.articles = []
        super.init()
    }
    
    
    
    // MARK: - Parse Method
    
    public func parse<T>(_ resultType: T.Type, data: Data) -> [T] {
        let results: [T] = []
        let parser = XMLParser(data: data)
        parser.delegate = self
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
            self.currentContent = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentContent += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
            
        case Article.tags.item.rawValue:
            articles.append(article)
            break
        case Article.tags.title.rawValue:
            article.title = currentContent
            break
        case Article.tags.description.rawValue:
            article.description = currentContent
            break
        case Article.tags.pubDate.rawValue:
            article.pubDate = currentContent
            break
        case Article.tags.link.rawValue:
            article.link = currentContent
            break
        case Article.tags.creator.rawValue:
            article.creator = currentContent
            break
            
        default: return
        }
    }
    
    
    
    
    
}
