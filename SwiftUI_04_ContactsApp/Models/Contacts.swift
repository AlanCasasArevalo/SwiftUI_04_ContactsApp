
import Foundation
import CoreData

final public class Contacts: NSManagedObject, Identifiable {
    
    @NSManaged public var name: String
    @NSManaged public var surname: String
    @NSManaged public var initials: String
    @NSManaged public var phone: String
    
}
