//
//  ItemDetailsVC.swift
//  ListItApp
//
//  Created by Jakub Slawecki on 02.02.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var PriceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    
    

    var stores = [Store]()  // etnity
    var itemToEdit: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // that will get rid off title from the back button 
        if let topItem = self.navigationController?.navigationBar.topItem {
            
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
//        let store = Store(context: context)
//        store.name = "Allegro"
//
//        let store2 = Store(context: context)
//        store2.name = "eBay"
//
//        let store3 = Store(context: context)
//        store3.name = "Zalando Lounge"
//
//        let store4 = Store(context: context)
//        store4.name = "Zalando"
//
//        let store5 = Store(context: context)
//        store5.name = "OLX"
//
//        let store6 = Store(context: context)
//        store6.name = "OPONEO.PL"
//
//        let store7 = Store(context: context)
//        store7.name = "Gymshark.com"
//
//        ad.saveContext()
        // added test data to coreData
        
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
        
    
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {  // numbers of columns
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //update when selected
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
            self.stores = try context.fetch(fetchRequest) // set a stores array to equal resoult that we get back
            self.storePicker.reloadAllComponents()
        } catch {
            
            // handle the error
        }
    }
    
    
    // adding new items to list:
    
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
                                        //that will add new item if item to edit is empty
                                        //and update exiting item if its not empty ;)
        
        if itemToEdit == nil {
            
            item = Item(context: context)
        } else {
            
            item = itemToEdit  // coreData ll take care of updating already existing one
        }
        
        if let title = titleField.text {
            
            item.title = title
        }
        
        if let price = PriceField.text {
            
            item.price = (price as NSString).doubleValue  // price is in double value,that will take care of conversion to string
        }
        
        if let details = detailsField.text {
            
            item.details = details
        }
        
        // store is already entity itself, above we have etnity item with atributes title, details, price etc.
        // so in case of store we assaignig store via relationship to item
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]  // we have only one column so in component 0
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true) // after we press save button that will dissmis itemDetailsVC
        
    }
    
    
    @IBAction func deleteBtnPressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil { // if we have something
            context.delete(itemToEdit!) // so simple with coreData!
            ad.saveContext()
        }
         _ = navigationController?.popViewController(animated: true)
    }
    
    
    func loadItemData() {
        
        if let item = itemToEdit {
            
            titleField.text = item.title
            PriceField.text = "\(item.price)"
            detailsField.text = item.details
            
            // that loop will assign store to storePicker
            if let store = item.toStore {
                
                var index = 0
                repeat {
                    
                    let s = stores[index]
                    if s.name == store.name {
                        
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
            
                    
                } while (index < stores.count)
            }
            
        }
    }
    
    
    
    
    
    
    
}




















