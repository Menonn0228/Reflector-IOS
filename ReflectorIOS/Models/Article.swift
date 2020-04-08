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
class Article {
    // MARK: - Properties
    // These are properties that will be retrieved from an RSS GET request
    var title: String?
    var description: String?
    var pubDate: String?
    var link: String?
    var creator: String?
    
}
