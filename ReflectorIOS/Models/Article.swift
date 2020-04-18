//
//  Article.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation

/*
 Example of what an article looks like from a GET Request
 <item>
     <title>MSU moves to optional pass/fail grading system</title>
     <description>Mississippi State University announced Monday that they would be going to an optional
                    pass/fail grading system. According to the university press release, students will be allowed
                        to choose per individual course to keep their actual letter grade or to change&#8230;</description>
     <pubDate>Mon, 06 Apr 2020 19:02:00 -0500</pubDate>
     <guid isPermaLink="false">http://www.reflector-online.com/tncms/asset/editorial/0bc5eefa-7863-11ea-9bc4-ab8dc9145847</guid>
     <link>http://www.reflector-online.com/news/article_0bc5eefa-7863-11ea-9bc4-ab8dc9145847.html</link>
     <dc:creator>Hannah Blankenship | Managing Editor</dc:creator>
 </item>
 
 */


/// This is an Article data model.
class Article: NSObject {
    // MARK: - Properties
    // These are properties that will be retrieved from an RSS GET request
    var title: String?
    /// This is  the short description of the article
    var details: String?
    /// Publish date
    var pubDate: String?
    /// Link to full HTML article
    var link: String?
    /// author of the articles
    var creator: String?
    
    
    /// The tags that identify an Article in an RSS feed. This is used in the XMLHelper class.
    enum tags: String {
        case item = "item"
        case title = "title"
        case description = "description"
        case pubDate = "pubDate"
        case link = "link"
        case creator = "dc:creator"
    }
    
    func debug_print() {
        print("==== ARTICLE DEBUG ====")
        print("Title: \(self.title ?? "NOT AVAILABLE")")
        print("Desc: \(self.details ?? "NOT AVAILABLE")")
        print("Date Published: \(self.pubDate ?? "NOT AVAILABLE")")
        print("Link: \(self.link ?? "NOT AVAILABLE")")
        print("Creator: \(self.creator ?? "NOT AVAILABLE")")
    }
    
}
