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
    
    
    
    // MARK: - Parse Method
    
    public func parse(data: Data) -> [Article] {
        let parser = XMLParser(data: data)
        parser.delegate = self
        self.object = Article()
        
        if !parser.parse() {
            print("Data Errors exist in XML. could not parse.")
        }
        return self.objects
    }
    
    
    // MARK: - XMLParser Delegate Methods
    func parserDidStartDocument(_ parser: XMLParser) {
        print("Starting to Parse")
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "item" {
            object = Article()
            self.currentContent = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentContent += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
            
        case Article.tags.item.rawValue:
            objects.append(object)
            break
        case Article.tags.title.rawValue:
            object.title = currentContent
            break
        case Article.tags.description.rawValue:
            object.desc = currentContent
            break
        case Article.tags.pubDate.rawValue:
            object.pubDate = currentContent
            break
        case Article.tags.link.rawValue:
            object.link = currentContent
            break
        case Article.tags.creator.rawValue:
            object.creator = currentContent
            break
            
        default: return
        }
    }
    
    
    
    
    
}
