//: Playground - noun: a place where people can play

import UIKit

/*
 --- Day 1: Inverse Captcha ---
 
 The night before Christmas, one of Santa's Elves calls you in a panic. "The printer's broken! We can't print the Naughty or Nice List!" By the time you make it to sub-basement 17, there are only a few minutes until midnight. "We have a big problem," she says; "there must be almost fifty bugs in this system, but nothing else can print The List. Stand in this square, quick! There's no time to explain; if you can convince them to pay you in stars, you'll be able to--" She pulls a lever and the world goes blurry.
 
 When your eyes can focus again, everything seems a lot more pixelated than before. She must have sent you inside the computer! You check the system clock: 25 milliseconds until midnight. With that much time, you should be able to collect all fifty stars by December 25th.
 
 Collect stars by solving puzzles. Two puzzles will be made available on each day millisecond in the advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!
 
 You're standing in a room with "digitization quarantine" written in LEDs along one wall. The only door is locked, but it includes a small interface. "Restricted Area - Strictly No Digitized Users Allowed."
 
 It goes on to explain that you may only leave by solving a captcha to prove you're not a human. Apparently, you only get one millisecond to solve the captcha: too fast for a normal human, but it feels like hours to you.
 
 The captcha requires you to review a sequence of digits (your puzzle input) and find the sum of all digits that match the next digit in the list. The list is circular, so the digit after the last digit is the first digit in the list.
 
 For example:
 
 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
 1111 produces 4 because each digit (all 1) matches the next.
 1234 produces 0 because no digit matches the next.
 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
 */

var input = "61697637962276641366442297247367117738114719863473648131982449728688116728695866572989524473392982963976411147683588415878214189996163533584547175794158118148724298832798898333399786561459152644144669959887341481968319172987357989785791366732849932788343772112176614723858474959919713855398876956427631354172668133549845585632211935573662181331613137869866693259374322169811683635325321597242889358147123358117774914653787371368574784376721652181792371635288376729784967526824915192526744935187989571347746222113625577963476141923187534658445615596987614385911513939292257263723518774888174635963254624769684533531443745729344341973746469326838186248448483587477563285867499956446218775232374383433921835993136463383628861115573142854358943291148766299653633195582135934544964657663198387794442443531964615169655243652696782443394639169687847463721585527947839992182415393199964893658322757634675274422993237955354185194868638454891442893935694454324235968155913963282642649968153284626154111478389914316765783434365458352785868895582488312334931317935669453447478936938533669921165437373741448378477391812779971528975478298688754939216421429251727555596481943322266289527996672856387648674166997731342558986575258793261986817177487197512282162964167151259485744835854547513341322647732662443512251886771887651614177679229984271191292374755915457372775856178539965131319568278252326242615151412772254257847413799811417287481321745372879513766235745347872632946776538173667371228977212143996391617974367923439923774388523845589769341351167311398787797583543434725374343611724379399566197432154146881344528319826434554239373666962546271299717743591225567564655511353255197516515213963862383762258959957474789718564758843367325794589886852413314713698911855183778978722558742329429867239261464773646389484318446574375323674136638452173815176732385468675215264736786242866295648997365412637499692817747937982628518926381939279935993712418938567488289246779458432179335139731952167527521377546376518126276"

func inverseCaptcha(input: String) -> Int {
    let enumeratedInput = input.enumerated()
    var counter = 0
    var previousCharacter = Character("a")
    var firstCharacter = Character("a")
    var accumulator = 0

    var index = 0
    for character in input {
        if index == 0 {
            firstCharacter = character
        }
        if (character == previousCharacter) {
            counter += 1
            accumulator += Int(String(character)) ?? 0
        } else {
            counter = 0
        }
        previousCharacter = character
        index += 1
    }
    
    if previousCharacter == firstCharacter {
        accumulator += Int(String(previousCharacter)) ?? 0
        
    }
    
// Enumeration no longer needed?
//    for (index, character) in enumeratedInput {
//        if (character == previousCharacter) {
//            counter += 1
//            accumulator += Int(String(character)) ?? 0
//        }
//        previousCharacter = character
//    }
    
//    if enumeratedInput.last
    
    print("Input:\n  \(input)\nResult:\n  \(accumulator)")
    return accumulator
}

inverseCaptcha(input: "1122") == 3 // Should = 3
inverseCaptcha(input: "1111") == 4 // Should = 4
inverseCaptcha(input: "1234") == 0 // Should = 0
inverseCaptcha(input: "91212129") == 9 // Should = 9
    
inverseCaptcha(input: input)
