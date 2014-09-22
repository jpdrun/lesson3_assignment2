// Playground - noun: a place where people can play

import UIKit

class Car {
    var name = ""
    var color = ""
    var horsepower = 0
    var automaticOption = ""
    
    init(nameOfCar: String, colorOfCar: String, horsepowerOfCar: Int, automaticOptionOfCar: Bool) {
        name = nameOfCar
        color = colorOfCar
        horsepower = horsepowerOfCar
        automaticOption = (automaticOptionOfCar ? "Automatic" : "Manual")
        
        println("My \(name) is \(color) and has \(horsepower) and is \(automaticOption)")
    }



    func setupCarDetailsWithName (nameOfCar: String, colorOfCar: String, horsepowerOfCar: Int, automaticOptionOfCar: Bool) {
        self.name = nameOfCar
        self.color = colorOfCar
        self.horsepower = horsepowerOfCar
        self.automaticOption = (automaticOptionOfCar ? "Automatic" : "Manual")
    
        println("My \(name) is \(color) and has \(horsepower) and is \(automaticOption)")
    }

}


var myRegularCar = Car(nameOfCar: "Regular Car", colorOfCar: "Red", horsepowerOfCar: 200, automaticOptionOfCar: true)


class TurboCar: Car {
    var turboRating = "" //Can be A to F
    var stabilizingSpoiler = ""
    
    func turboCarSpecs (aTurboRating: String, aSpoiler: Bool) -> String {
        self.turboRating = aTurboRating
        self.stabilizingSpoiler = (aSpoiler ? "a" : "no")
        
        return ("In addition, this turbo car has a turbo rating of \(self.turboRating) and \(self.stabilizingSpoiler) spoiler")
    }
}


//This is the second category of cars: a turbo car

// This is understood:   after changing to init in class car, the below line now expects us to fill in the details from the init and not just create a variable within the class.  It is expecting values when the variable is declared.  Left here as an error to illustrate this - and keep for future reference.
var myTurboCar = TurboCar()

// the below line would work
var myTurboCar = TurboCar(nameOfCar: "Turbo Car", colorOfCar: "blue", horsepowerOfCar: 300, automaticOptionOfCar: true)

println()

// with the init now in parent "Car" - setupCarDetailsWithName is no longer needed.
myTurboCar.setupCarDetailsWithName("Turbo Car", colorOfCar: "Blue", horsepowerOfCar: 300, automaticOptionOfCar: true)

println(myTurboCar.turboCarSpecs("B", aSpoiler: true))



class HybridCar: Car {
    
    var electricHorsepower: Float = 0.0
    
    override var name : String {
        get {
            super.name = "Hybrid"
            return super.name + "Tech"
        }
        
        set {
            //Nothing here for now
        }
    }
    
    override func setupCarDetailsWithName(nameOfCar: String, colorOfCar: String, horsepowerOfCar: Int, automaticOptionOfCar: Bool) {
        self.name = nameOfCar
        self.color = colorOfCar
        self.automaticOption = (automaticOptionOfCar ? "Automatic" : "Manual")
        
        self.electricHorsepower = 0.9 * Float(horsepowerOfCar)
        
        println("My \(name) is \(color) and has \(electricHorsepower) Electric horsepower (bhp) and is \(automaticOption)")
    }
}


// This is understood:   after changing to init in class car, the below line now expects us to fill in the details from the init and not just create a variable within the class.  It is expecting values when the variable is declared.  Left here as an error to illustrate this - and keep for future reference.
var myHybridCar = HybridCar()

println()

myHybridCar.setupCarDetailsWithName("Hybrid Car", colorOfCar: "Yellow", horsepowerOfCar: 100, automaticOptionOfCar: true)

myHybridCar.name


class PickUpTruck: Car {

    var cargoBedWidth: Double = 0
    var cargoBedLength: Double = 0
    
    var totalCargoArea: Double {
        
        get {
            return cargoBedWidth * cargoBedLength
        } //Closes the getter declaration
        
        set {
            cargoBedLength = sqrt(newValue)
            cargoBedWidth = cargoBedLength
        } // Closes the setter declaration

    } //Closes the variable delcaration

} // Closes the class declaration


//This is the fourth category of cars:  a Pickup Truck

//Scenario 1 - Use the setter to work back to calculate the length and width


// This is understood:   after changing to init in class car, the below line now expects us to fill in the details from the init and not just create a variable within the class.  It is expecting values when the variable is declared.  Left here as an error to illustrate this - and keep for future reference.
var myPickupTruck = PickUpTruck()

myPickupTruck.totalCargoArea = 3000.0

println("The truck's bed length is \(myPickupTruck.cargoBedLength) and the width is \(myPickupTruck.cargoBedWidth) and the total cargo area is \(myPickupTruck.totalCargoArea)")

//Scenario 2 - Set the length and width of the cargo area and use only the getter to calculate the area.

myPickupTruck.cargoBedLength = 50
myPickupTruck.cargoBedWidth = 60

println("The truck's cargo bed length is \(myPickupTruck.cargoBedLength) and the cargo bed width is \(myPickupTruck.cargoBedWidth) and the total cargo area is \(myPickupTruck.totalCargoArea)")




/*
var myPickupTruck = PickUpTruck()
myPickupTruck.cargoBedWidth = 50
myPickupTruck.cargoBedLength = 60

println()

println("The total cargo area for the pickupTruck is \(myPickupTruck.totalCargoArea).")

*/



