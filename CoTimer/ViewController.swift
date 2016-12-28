//
//  ViewController.swift
//  CoTimer
//
//  Created by Aditya on 28/12/16.
//  Copyright © 2016 Tnex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hoursTextfield: UITextField!
    @IBOutlet weak var minutesTextfield: UITextField!
    @IBOutlet weak var secondsTextfield: UITextField!
        @IBOutlet weak var inSeconds: UILabel!
    @IBOutlet weak var counter: UILabel!
        var count:Int = 0
    
    // global count set zero intially which will change as in ibaction press me
    // it has to be taken globally so as to in view did load 
    // also very important is that : the variable is set to Int as the functionality  ,where the count opeation is done it requires binary operators like (+ , / , * ) hence in order to work on them , we need the type of count as Int
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timer here # selector is calling method update
                _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.update)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func inSeconds(inhours:String ,inminutes: String ,inseconds:String) -> String
    {
        let hoursstr =  (Int (hoursTextfield.text!))! * 3600   // int : type casting
        let minutestr =  (Int (minutesTextfield.text!))! * 60   // int type casting
        let secondstr =  Int (secondsTextfield.text!)  // int type casting
    let final = ( hoursstr + minutestr + secondstr!)   // int   type casting
        return  String(final) // again it is been type casted to string as return type is string
    }
    
    // in update method , what exactly happening is 
    //whatever the count which is getting obtained from ibaction " hitthe button " , which was global is getting
    // revised from 0 to whatever value which is generated from function named "  inseconds "
    func update()  {
        
        
        // Functionality logic
        
    //firstly it checks whether the count is greater than   zero or not
        // secondly the count value is broken into 3 parts now whatever x value which it has 
        // is now broken into hours , minutes , seconds 
        // third , so in order to store that broken values we define a container to store it 
        // also note that
        
        // example 7262 , answer is 2 hours : 1 minute : 2 seconds
        // nnote there are various ways of achieving this
        if(count > 0)
        {
            let hours =     String (count  / 3600) // 7262/ 3600 = 2 hours , note '/' gives the quotient
            let minutes =  String((count / 60) % 60) //  7262 /3600 = 
            let seconds = String(count % 60)
            count -= 1
            counter.text = "\(hours) : \(minutes) : \(seconds)"
        }
    }
    
    
    // here lots of things are happening ,its the start point , from where the method calling taking place
    // inseconds method is geeting called and its return type " String " is getting captured
    // in constant named  "Counter" ,
    // once its getting captured in constant named counter its getting loaded on
    // label named inseconds ,is getting updated 
    //finally most important now , the global variable named count whose value was 0 at start is now getting updated by constant named counter 
    
    @IBAction func hitTheButton(_ sender: Any)
    {
        // method called named inseconds  with paramters here hourstextfield ,minutestextfield , insecondstextfield whhich the user enters 
        // here return type is returned , here in this case it was string return type , so swift automatically detects the type inferencing 
        
  let counter    =  inSeconds(inhours: hoursTextfield.text!, inminutes: minutesTextfield.text!, inseconds: secondsTextfield.text!)
        // var or let  x  = > function return type stored  in 'x'
        inSeconds.text = counter
    count = Int (counter)! // global variable now getting replaced with intial value 0 to current updated value, 
        //again we have to type cast it as the main counter constant was string since the return type of method named in seconds is string
    }
}

