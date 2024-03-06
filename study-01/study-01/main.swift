//
//  main.swift
//  study-01
//
//  Created by 이상현 on 3/6/24.
//

import Foundation

print("Hello, World!")

let a: Double = 31.2

print(a)

let s: String = "Hello \(a) WOrld!!" + String(a)

print(s)

let apples = 3

let oranges = 5

let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

print(quotation)

let quotation2 = """
동해물과 백두산이 마르고 \(apples) 닳도록
말씀하시길, "하느님이 보우하사" 우리나라 만세
"""

print(quotation2)

var shoppingList = ["fish", "water", "paint"]
shoppingList[1] = "bottle of water"

print(shoppingList)

var occupations = [
    "Malcolm": "Captain",
    "kaylee": "Mechanic",
]
occupations["Jayne"] = "public Relations"

print(occupations)

shoppingList.append("blue paint")
print(shoppingList)

occupations["Ace"] = "Engineer"
occupations["Malcolm"] = "Master"
print(occupations)

let scores = [75, 42, 32, 33, 11]
var teamScore = 0
for score in scores {
    if score >= 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

print("##########")

var optionalString: String? = "Hello"
print(optionalString == nil) // false

var optionalName: String? = "John Apple"
// optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting += " \(name)"
} else {
    greeting += " Who are you?"
}
print(greeting)

let nickName: String? = nil
let fullName: String = "John Applesseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins.")
case "cucumber", "watercress":
    print("That would make a good sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is is a spicy \(x)?")
default:
    print("Everything tastes good.")
}

var n = 2
while n < 100 {
    n = n * 2
}
print(n) // 128

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m) // 128
