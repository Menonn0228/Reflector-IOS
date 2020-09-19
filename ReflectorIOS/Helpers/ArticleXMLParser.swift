//
//  articleXMLParser.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/7/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI


protocol Parser {
    associatedtype ParsedObjectType
    func parse(data: Data) -> ParsedObjectType
}

/// Parses the XML Articles that are retrieved from RSSService.
final class ArticleXMLParser: NSObject {
    private var objects: [Article]
    private var object: Article!
    private var currentContent: String = String()
    
    enum XMLHelperError: Error {
        case invalidDataInput
    }
    
    public var data: Data!
    
    // MARK: - Init Method
    override required init() {
        self.objects = []
        super.init()
    }
}

// MARK: - Tags

extension ArticleXMLParser {
    /// The tags that identify an Article in an RSS feed. This is used in the XMLHelper class.
    private enum Tags: String {
        case item = "item"
        case title = "title"
        case description = "description"
        case pubDate = "pubDate"
        case link = "link"
        case creator = "dc:creator"
    }
}

// MARK: - Parse Method

extension ArticleXMLParser: Parser, XMLParserDelegate {
    /// parse takes in a type `Data` and will attempt to decode. This function will return a type `[Article]`
    func parse(data: Data) -> [Article] {
        let parser = XMLParser(data: data)
        parser.delegate = self
        self.object = Article()
        
        if !parser.parse() {
            print("Data Errors exist in XML. could not parse.")
        }
        return self.objects
    }
    
    
    // MARK: - XMLParser Delegate Methods
    // All of these methods below are from the XMLParserDelegate and are called as Swift attempts to decode XML data.
    // These methods should not be tampered with.
    // Sauce: https://makeapppie.com/2016/06/06/how-to-read-xml-files-from-the-web-in-swift/
    
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Starting to Parse")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        switch elementName {
        case Tags.item.rawValue:
            object = Article()
            self.currentContent = ""
            break
            
        default:
            self.currentContent = ""
        }
        
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentContent += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        
        case Tags.item.rawValue:
            objects.append(object)
            break
        case Tags.title.rawValue:
            object.title = currentContent
            break
        case Tags.description.rawValue:
            object.details = currentContent
            break
        case Tags.pubDate.rawValue:
            object.pubDate = currentContent
            break
        case Tags.link.rawValue:
            object.link = currentContent
            break
        case Tags.creator.rawValue:
            object.creator = currentContent
            break
            
        default: return
        }
    }
}
