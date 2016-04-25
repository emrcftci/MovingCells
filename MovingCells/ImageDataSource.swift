//
//  ImageDataSource.swift
//  MovingCells
//
//  Created by Ozgur Vatansever on 4/24/16.
//  Copyright © 2016 Techshed. All rights reserved.
//

import UIKit

class ImageDataSource {
  
  private var images = [UIImage]()
  
  init() {
    self.loadImages()
  }
  
  private func loadImages() {
    let filePath = NSBundle.mainBundle().pathForResource("Images", ofType: "plist")!
    images.removeAll()
    
    for loadedImage in NSArray(contentsOfFile: filePath) ?? [] {
      if let imageDict = loadedImage as? [String: String] {
        images.append(UIImage(named: imageDict["image"]!)!)
      }
    }
  }
  
  subscript(index: Int) -> UIImage? {
    if index < 0 || index >= images.count {
      return nil
    }
    return images[index]
  }
  
  var count: Int {
    return images.count
  }
  
  func exchangeImageAtIndex(index: Int, withImageAtIndex otherIndex: Int) {
    if index != otherIndex {
      swap(&images[index], &images[otherIndex])
    }
  }
}
