//  AppDelegate.swift
//  CData
//
//  Created by Haya on 1/12/18.
//  Copyright © 2018 Haya. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var books = [Book]()
    var authors = [Author]()
    public func addBookwithName(nam : String) ->Book {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let Bookentity :NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Book", in: context)
        let b1:Book = Book(entity: Bookentity!, insertInto: context)
        b1.title = nam
        do {
            try context.save()
            print("book saved")
        } catch  {
            print("Something went wrong.")
        }
        return b1
    }
    
    
    public func StatusOfBooks(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            
            books = try context.fetch(Book.fetchRequest())
            print(" total num of books = \(books.count)")
            
        }
            
        catch{
            print("Error")
        }
        for i in books{
            print(i.title)
            
        } }
    
    
    
    public func EditBookWithName(BName:String,ofBook:Book) -> Book{
        ofBook.title = BName
        return ofBook
    }
    
    
    public func deleteBook(Boook:Book){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        context.delete(Boook)
        print("deleted book")
        
    }
    public func getBookWithName(Bname: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
        let key = Bname
        //  let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "title == %@", Bname)
        
        
        do{
            
            books = try context.fetch(fetchRequest)
            if books.count > 0 {
                
                let BOOKName = (books[0] as AnyObject).value(forKey: "title") as! String
                print("got book  =\(BOOKName)")
            }
            else{
                print("no book found ")
            } }
            
        catch{
            print("Error")
        }
        
    }
    
    
    public func addAuthorwithName(nam : String) ->Author {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let Authentity :NSEntityDescription? = NSEntityDescription.entity(forEntityName: "Author", in: context)
        
        let a1:Author = Author(entity: Authentity!, insertInto: context)
        a1.name = nam
        //   let uuid = UUID().uuidString
        // b1.setValue(uuid, forKey: "id")
        do {
            try context.save()
            print("author saved")
        } catch  {
            print("Something went wrong.")
        }
        return a1
        
        
    }
    public func StatusOfAuthors(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            
            authors = try context.fetch(Author.fetchRequest())
            print(" total num of authors = \(authors.count)")
        }   catch{
            print("Error")
        }
        for i in authors{
            print(i.name)}}
    
    
    
    public func EditAuthorWithName(AName:String,ofAuthor:Author) -> Author{
        
        
        ofAuthor.name = AName
        
        
        print("new author name =\(ofAuthor.name)")
        
        return ofAuthor
    }
    public func deleteAuthor(Auth:Author){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        context.delete(Auth)
        print("deleted author")
        
    }
    public func getAuthorWithName(Aname: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Author>(entityName: "Author")
        //  let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "name == %@", Aname)
        
        do{
            
            authors = try context.fetch(fetchRequest)
            if authors.count > 0 {
            let AUTHORName = (authors[0] as AnyObject).value(forKey: "name") as! String
                print("got author  =\(AUTHORName)")
            }
            else{
                print("no author found ")
            }
        }
            
        catch{
            print("Error")
        }
        
    }
    func addAuthorsToBook(b:Book, auths:Array<Author>) ->Array<Any> {
        var t = b.authors?.allObjects
        
        t?.append([auths])
        
        return t!
        
    }
    
    func addBooksToAuthos (a:Author, books:Array<Book>) ->Author{
        var t =    a.books?.array
        var W =   a.books?.array
        W?.append(books)
        //t = b.authors?.allObjects
        print(W)
        return a
        
    }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // var b1:Book = addBookwithName(nam: "persuasion")
        getBookWithName(Bname: "persuasion")
        //deleteBook(Boook: books[0])
        StatusOfBooks()
        //  var auth1:Author = addAuthorwithName(nam: "Jane")
        
        StatusOfAuthors()
        
        //deleteAuthor(Auth: authors[0])
        StatusOfAuthors()
        
        //    deleteAuthor(Auth: authors[1])
        StatusOfAuthors()
        
        
        //  EditAuthorWithName(AName: "Goldings", ofAuthor: authors[0])
        //getAuthorWithName(Aname: "Goldings")
        
        
        StatusOfBooks()
        //        addBookwithName(nam: "lords")
        StatusOfBooks()
        // deleteBook(Boook: books[0])
        StatusOfBooks()
        StatusOfAuthors()
        
        // addBookwithName(nam: "the tale of two cities")
        
        // addAuthorwithName(nam: "Charles")
        StatusOfBooks()
        
        // addObject(b: books[0], auths: [authors[1],authors[0]])
        // addAuthorsToBook(b: books[0], auths: [authors[0],authors[1]])
        
        
        //        var D = addBooksToAuthos(a: authors[0], books: [books[0]])
        //
        //  print(D)
        //addBookwithName(nam: "lords")
        
        var BAuthors = addAuthorsToBook(b: books[1], auths: [authors[1],authors[0]])
        for y in BAuthors{
            print(BAuthors)
        }
        return true
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "CData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

