// Playground - noun: a place where people can play

import UIKit

let str: NSString = "Hello, playground"

let someNewInput: String = "foololo"

//what is NSRange http://nshipster.com/nsrange/
//In Foundation, NSRange instead encodes a range as struct containing the location and length
let myrange: NSRange = NSMakeRange(0, 5)

let changed: NSString = str.stringByReplacingCharactersInRange(myrange, withString: someNewInput)

let string: NSString = "lorem ipsum dolor sit amet"
let range1: NSRange = string.rangeOfString("lorem")
let range: NSRange = string.rangeOfString("lorem ix")
range.location == NSNotFound
range.length

let arr1: NSArray = [1,2,3,4,5,6,7,8]
arr1.count
_stdlib_getTypeName(arr1)
_stdlib_getTypeName((arr1 as [Int]))
(arr1 as [Int])[2...3]

let subArr: NSArray = arr1.subarrayWithRange(NSMakeRange(arr1.count/2, arr1.count-4))
_stdlib_getTypeName(subArr)

var subscriptableArray = ["zero", "one", "two", "three"]
_stdlib_getTypeName(subscriptableArray)
let subRange = subscriptableArray[2...3]
subRange.description
_stdlib_getTypeName(subRange)


let swiftedSubArr: Array = subArr as [Int]

let evenElementsArr =  swiftedSubArr.filter { $0 % 2 == 0}
evenElementsArr

let foo = (subArr as [Int]).filter { $0 % 2 == 0}
foo
foo.count

// comprehensions http://stackoverflow.com/questions/24003584/list-comprehension-in-swift
let evens = Array(filter(1..<10) { $0 % 2 == 0 })
evens

let other_way_evens = stride(from:1, to:10, by: 2)
other_way_evens

let cubics = Array(map(1..<10) { $0 * $0 * $0 })
cubics

let cubics_from_evens = Array(map(filter(1..<10) { $0 % 2 == 0 }) { $0 * $0 * $0 })
cubics_from_evens

let evens_of_cubcs = Array(filter(map(1..<10) { $0 * $0 * $0 }) { $0 % 2 == 0 })
evens_of_cubcs

let range: NSRange = NSMakeRange(0, 10)
