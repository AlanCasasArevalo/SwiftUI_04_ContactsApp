
import Foundation
import CoreData

final public class Contacts: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var initials: String
    @NSManaged public var phone: String
    
}

//
//extension Contacts {
//    static func performRequest () -> NSFetchRequest<Contacts> {
//        let request = Contacts.fetchRequest() as! NSFetchRequest<Contacts>
//        request.sortDescriptors = [NSSortDescriptor(key: "initials", ascending: true)]
//        return request
//    }
//}
