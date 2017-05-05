//
//  main.swift
//  PenisParser
//
//  Created by Jack Clark on 5/4/17.
//  Copyright © 2017 Jack Clark. All rights reserved.
//
// http://stackoverflow.com/questions/24097826/read-and-write-data-from-text-file
// https://github.com/shoumikhin/StreamScanner

import Foundation
import Cocoa

class DataImporter
{
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager
{
    lazy var importer = DataImporter()
    var data = String[]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data += "Some data"
manager.data += "Some more data"
// the DataImporter instance for the importer property has not yet been created”

print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created
// prints "data.txt”

let file = "file.txt" //this is the file. we will write to and read from it

let text = "some text" //just a text

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    let path = dir.appendingPathComponent(file)
    
    //writing
    do {
        try text.write(to: path, atomically: false, encoding: String.Encoding.utf8)
    }
    catch {/* error handling here */}
    
    //reading
    do {
        let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)
    }
    catch {/* error handling here */}
}

do {
    // get the documents folder url
    let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    // create the destination url for the text file to be saved
    let fileDestinationUrl = documentDirectoryURL.appendingPathComponent("file.txt")
    
    let text = "some text"
    do {
        // writing to disk
        try text.write(to: fileDestinationUrl, atomically: false, encoding: .utf8)
        
        // saving was successful. any code posterior code goes here
        // reading from disk
        do {
            let mytext = try String(contentsOf: fileDestinationUrl)
            print(mytext)   // "some text\n"
        } catch let error as NSError {
            print("error loading contentsOf url \(fileDestinationUrl)")
            print(error.localizedDescription)
        }
    } catch let error as NSError {
        print("error writing to url \(fileDestinationUrl)")
        print(error.localizedDescription)
    }
} catch let error as NSError {
    print("error getting documentDirectoryURL")
    print(error.localizedDescription)
}
let fileName = "Test"
let dir = try? FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask, appropriateFor: nil, create: true)

// If the directory was found, we write a file to it and read it back
if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {
    
    // Write to the file Test
    let outString = "Write this text to the file"
    do {
        try outString.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
    }
    
    // Then reading it back from the file
    var inString = ""
    do {
        inString = try String(contentsOf: fileURL)
    } catch {
        print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
    }
    print("Read from the file: \(inString)")
}
public extension String {
    func contentsOrBlank()->String {
        if let path = Bundle.main.path(forResource:self , ofType: nil) {
            do {
                let text = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                return text
            } catch { print("Failed to read text from bundle file \(self)") }
        } else { print("Failed to load file from bundle \(self)") }
        return ""
    }
}

let t = "yourFile.txt".contentsOrBlank()
let r:[String] = "yourFile.txt"
    .contentsOrBlank()
    .characters
    .split(separator: "\n", omittingEmptySubsequences:ignore)
    .map(String.init)

let s = try String(contentsOfFile: NSBundle.mainBundle().pathForResource("myFile", ofType: "txt")!)

let file = "file.txt"

let dirs: [String]? = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]

if (dirs != nil) {
    let directories:[String] = dirs!
    let dirs = directories[0]; //documents directory
    let path = dirs.stringByAppendingPathComponent(file);
    let text = "some text"
    
    //writing
    text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding, error: nil);
    
    //reading
    var error:NSError?
    
    //reading
    let text2 = String(contentsOfFile: path, encoding:NSUTF8StringEncoding, error: &error)
    
    if let theError = error {
        print("\(theError.localizedDescription)")
    }
}
