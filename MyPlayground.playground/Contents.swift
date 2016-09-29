
import Foundation

class Person: NSObject {
    
    var nameFirst: String
    var nameLast: String
    var DOB: NSDate
    var height: Int?
    var weight: Int?
    var contactDeets: ContactDetails?
    
    
    override init(){
        self.nameFirst = "Ben"
        self.nameLast = "Dover"
        self.DOB = NSDate()
        self.height = 109
        self.weight = 50
        self.contactDeets = ContactDetails()
        
    }
    
    init (firstName: String, lastName: String, DateOfBirth: NSDate)
    {
        self.nameFirst = firstName
        self.nameLast = lastName
        self.DOB = DateOfBirth
    }
}

class ContactDetails {
    
    var phoneNumber: String?
    var mobileNumber: String?
    var emailAddress: String?
    var homeAddress: HomeAddress
    
    
    init(){
        self.phoneNumber = "000-000-000"
        self.homeAddress = HomeAddress(state: "VIC")
        
    }
    
    init (emailAddress: String, homeAddress: HomeAddress){
        self.emailAddress = emailAddress
        self.homeAddress = HomeAddress(state: "VIC")
        
    }
    
}

class HomeAddress {
    
    var street: String?
    var suberb: String?
    var state: String
    var postCode: String?
    var country = "Australia"
    
    init (state: String){
        self.state = state
        
    }
}




var daniel = Person()
daniel.contactDeets

print(daniel.contactDeets?.phoneNumber!)
    
daniel.nameFirst
daniel.nameLast
daniel.DOB
daniel.height
daniel.contactDeets!.phoneNumber = "999-999-999"
daniel.contactDeets

print(daniel.contactDeets?.phoneNumber!)

if let Deets = daniel.contactDeets{
    if let Num = Deets.phoneNumber{
        print(Num)
    }
}




















