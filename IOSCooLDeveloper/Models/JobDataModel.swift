

import Foundation


struct JobDataModel : Decodable{
    var id:String? = "0"
    var position: String? = ""
    var company : String? = ""
    var company_logo: String? = ""
    var description : String? = ""
    var location : String? = ""
    var salary_min : Double? = 0.0
    var salary_max : Double? = 0.0
    var tags : [String]? = []
    
}

