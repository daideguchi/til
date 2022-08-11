import UIKit


//
//let a:[Int] = [1,2,3,4,5]
//
//
//let b = a[0]
//let c = a[2]
//
//
//var e = [1,2,3,4,5]
//e.append(6)
//e[2] = 9
//
//e
//e.remove(at: 3)
//


//let a = ["Taro": 1985, "Hanako": 1986]
//
//let b = a["Taro"]
//let c = a["Hanako"]
//
//var d:[String: Int] = ["Taro": 1985, "Hanako": 1986]
//d["jiro"] = 1988
//d
//d["Taro"] = 1984
//d
//d.removeValue(forKey: "Hanako")
//d


//for i in 0..<10{
//    print(i)
//}
//
//for i in 0...10{
//    print(i)
//}
//
//
//var a:[Int] = []
//for i in 0..<10{
//    a.append(i)
//}
//
//for i in a{
//    print(i)
//}


//var a:[Int] = []
//for i in 0..<10{
//    a.append(i)
//}
//
//a

//var a :[Int] = []
//for i in 0..<10{
//    if i%2 == 0{
//        a.append(i)
//    }
//}
//
//var b :[Int] = []
//for i in 0..<10{
//    if i%3 == 0{
//        b.append(i)
//    }
//}
//
//func a() {
//    print("Hello")
//}
//
//
//a()
//
//
//let b = 123
//func c() {
//    if b == 123{
//        print("Hi")
//    }
//}
//
//c()
//
//func d() {
//    let e = 456
//    print(e)
//}
//d()
//


//let a = 4
//let b = 6
//
//func add1(c: Int,d: Int) {
//    _ = c + d
//}
//add1(c: a, d: b)
//
//func add2(c: Int, d: Int) -> Int{
//    let e = c+d
//    return e
//}
//
//let f = add2(c:a,d:b)


////クラス　設計図のようなもの
//class Dog {
//    var name = ""
//    func bark(){
//        let message = name + ": Bow-wow"
//        print(message)
//    }
//}
//
////インスタンス　製品のようなもの
//let pochi = Dog()
//pochi.name = "Pochi"
//
//pochi.bark()
//
//
//let hachi = Dog()
//hachi.name = "Hachi"
//hachi.bark()

////--------
//class Dog{
//    var name = ""
//    //型を指定。インスタンスを作らなくても呼び出せる　※
//    static var breed = ""
//}
//
////インスタンスを生成
//let pochi = Dog()
//pochi.name = "Pochi"
//pochi.name
//
////※
//Dog.breed = "Akitaken"
//Dog.breed

//------

//class Dog {
//    //インスタンスプロパティ
//    func bark(){
//        print("Bow-wow")
//    }
//    //型プロパティ
//    static func barkstatic(){
//        print("Bow-wow-wow")
//    }
//}
////インスタンスプロバティ：インスタンスを生成して呼び出し
//let pochi = Dog()
//pochi.bark()
//
////型プロパティ：インスタンスを生成しないで呼び出し可能
//Dog.barkstatic()

//------イニシャライザ

//class Dog{
//    var name = ""
//    var age = 0
//
//    init(name: String, age: Int){
//        self.name = name
//        self.age = age
//    }
//}
//
//let pochi = Dog(name: "Pochi", age: 5)
//pochi.name
//pochi.age

//-----クラスの継承

//class Dog{
//    var name = ""
//    func bark(){
//        let message = name + ":Bow-wow"
//        print(message)
//    }
//}
//
////クラス名の後に　：　をつけると、後ろのクラスを承継することができる
//class Shibainu: Dog {
//    var age = 0
//    func sayAge(){
//        let message = name + ": I'm \(age) years old."
//        print(message)
//    }
//}
//
////shibainuクラスからtaroインスタンスを生成
//let taro = Shibainu()
//taro.name = "Taro"
//taro.age = 5
//taro.bark()
////↓継承したクラスを使用することができている
//taro.sayAge()

//------構造体(データの保持のみの場合は構造体、それ以外はclassを使うと良い)

//struct Dog{
// var name = ""
// var breed = ""
//}
//
//let pochi = Dog(name: "Pochi", breed: "Akitaken")
//pochi.name
//pochi.breed
//
//struct Cat{
//    var name: String?
//    var breed: String?
//}
//let tama = Cat(name:"Tama", breed:nil)
//tama.name
//tama.breed

//------列挙型(複数の選択肢を利用する場合便利)

//enum Signal{
//    case Blue
//    case Yellow
//    case Red
//}
//
////sigにSignalの値が入る
//var sig:Signal
//sig = Signal.Blue
//
//switch sig{
//case .Blue:
//    print("Go!")
//case.Yellow:
//    print("caution!")
//case.Red:
//    print("stop!")
//}

//-----値渡しと参照渡し

//参照渡し:　クラスの場合
//class Dog{
//    var age = 0
//}
//
//var pochi = Dog()
//pochi.age = 5
//
//var hachi = pochi
//hachi.age = 7
//
//pochi.age
//hachi.age
//
////値渡し: 構造体の場合
//struct Cat{
//    var age = 0
//}
//
//var tama = Cat()
//tama.age = 5
//
//var mike = tama
//mike.age = 7
//
//tama.age
//mike.age
//
////値渡し
//var a = 5
//var b = a
//b = 7
//a
//b

//------クロージャ(関数を変数のように扱う)
//let getAgeMessage = {(name: String, age: Int) -> String in
//    let message = name + ": I'm \(age) years old."
//    return message
//}
//
//let result = getAgeMessage("Pochi", 5)
//print(result)
//
//func sayAge(name:String, age: Int, getMessage:(String, Int)-> String){
//    let message = getMessage(name, age)
//    print(message)
//}
//
//sayAge(name:"Hachi", age:12 , getMessage: getAgeMessage)

//------プロトコル　規約

//protocol Fish{
//    var color: String{get set}
//    func swim()
//}
//
//class Shark: Fish {
//    var color: String = "Blue"
//    func swim(){
//        print("Now quickly swimming...")
//    }
//}
//
//struct Ray: Fish{
//    var color: String = "Brown"
//    func swim(){
//        print("Now slowly swimming...")
//
//    }
//}

//-----デリゲート

//protocol SardineDelegate: AnyObject{
//    func didEatSardine()
//}
//
//class Sardine {
//    weak var delegate: SardineDelegate?
//    func eaten(){
//        print("I was eaten...")
//        //delegateがnilではない場合のみ.以下を実行
//        delegate?.didEatSardine()
//    }
//}
//
//class Shark: SardineDelegate{
//
//    func eat(){
//        let sardine = Sardine()
//        sardine.delegate = self
//        sardine.eaten()
//    }
//
//
//    func didEatSardine(){
//        print("I ate a sardine!")
//    }
//}
//
//let shark = Shark()
//shark.eat()
