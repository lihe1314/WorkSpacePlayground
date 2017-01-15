//: Playground - noun: a place where people can play

import UIKit


//// 12/01/2017

var str = "Hello, playground"
var obj: AnyObject

var button = UIButton()

button.setTitle("abcde", for: UIControlState.application)


obj = NSDate()
obj.addingTimeInterval(3600)

obj = UIColor(red: 1,green: 0, blue:0,alpha:1)

if obj is NSDate {
    
     obj.addingTimeInterval(3600)
}

//bridged with object c object nsstring
var strUpdated = "this is a swift string"

//: MARK: guard

/*

 using the #guard#
 

 Unlike an if statement, guard statements only run if the conditions are not met. You can think of guard more like an Assert, but rather than crashing, you can gracefully exit.
 

 for more detail here is the good #resource http://ericcerney.com/swift-guard-statement/
 
*/

func stringFromData(_ data: Data?) -> String?{
    
    guard let data = data,
        let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue), data.count > 0 else{
            return nil
    }
    
    return String(str)
}
func example1(){
    
    
    //check the guard function from the stringFormt
    if let _ = stringFromData(nil){
        print("Got the string")
    } else {
        print("No string came back")
    }
    
}
func example2(){
    
    let data = String("any string").data(using: .utf8)
    
    guard (data?.count)! > 0 else{
        return
    }
    
    if let str = stringFromData(data){
        print("Got the string \(str)")
    } else {
        print("No string came back")
    }
    
}
func example3(firstName: String?, lastName: String?, age: UInt8?) -> String{
    
    guard let firstName = firstName, let lastName = lastName , let _ = age,
        firstName.characters.count > 0 && lastName.characters.count > 0 else{
            return ""
    }
    
    return firstName + " " + lastName
    
}

example1()
example2()
example3(firstName: "Food", lastName: "Bar", age: 30)
example3(firstName: "1", lastName: "Bar", age: 30)

//  #defer

enum Errors : Error{
    case emptyString
}



func getThisDoneBeforeQuit()
{
    print("i AM CALLED")
    
}


func imageForString(_ str: String, size: CGSize) throws -> UIImage{
    
    defer{
        getThisDoneBeforeQuit()
    }
    
    UIGraphicsBeginImageContextWithOptions(size, true, 0)
    
    if str.characters.count == 0{
        throw Errors.emptyString
    }
    
    //draw the string here...
    
    print("i AM HERE")
    
    return UIGraphicsGetImageFromCurrentImageContext()!
    
    
}

do{
    
    let i = try imageForString("Foo",
                               size: CGSize(width: 100, height: 50))
    
    
}
catch let excep
{
    print(excep)
}

// end #defer


// #checkapi

enum ErrorsAPI : Error{
    case EmptyData
}

func bytesFromData(data: NSData) throws -> [UInt8]{
    if (data.length == 0){
        throw ErrorsAPI.EmptyData
    }
    var buffer = [UInt8](repeating: 0, count: data.length)
    
    //core thing is here, if different api was released
    //using the different way for calling the function 
    //the code is dealing with the deployment target 
    //when using the #available(iOS 8.1, *)
    if #available(iOS 8.1, *){
        data.getBytes(&buffer, length: data.length)
    } else {
        data.getBytes(&buffer)
    }
    return buffer
}





