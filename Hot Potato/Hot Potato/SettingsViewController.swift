//
//  SettingsViewController.swift
//  Hot Potato
//
//  Created by Luther Yu on 12/5/19.
//  Copyright © 2019 Luther Yu. All rights reserved.
//

import UIKit
import SwiftUI
import CoreData

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var quickPlayTimeText: UITextField!
    @IBOutlet weak var tapPotatoNumText: UITextField!
    public var quickPlayTime = 5.0
    public var tapPotatoNum = 5.0
    var settings = [UserSettings]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var fetchRequest: NSFetchRequest<UserSettings>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            fetchRequest = UserSettings.fetchRequest()
            let settings = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
//            self.settings = settings
            if(settings.count > 0){
                quickPlayTimeText.text = String(settings[0].hotPotatoInput)
                tapPotatoNumText.text = String(settings[0].tapPotatoInput)
            }
            else{
                let defaults = UserSettings(context: appDelegate.persistentContainer.viewContext)
                defaults.hotPotatoInput = 10
                defaults.tapPotatoInput = 10
                appDelegate.saveContext()
            }
        }catch {
        }
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let settings = UserSettings(context: appDelegate.persistentContainer.viewContext)
        do{
            let settings = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            settings[0].setValue(Int32(quickPlayTimeText.text!) ?? 10, forKey: "hotPotatoInput")
            settings[0].setValue(Int32(tapPotatoNumText.text!) ?? 10, forKey: "tapPotatoInput")
            appDelegate.saveContext()

        }catch{
            
        }

        quickPlayTime = Double(quickPlayTimeText.text!) ?? 10
        tapPotatoNum = Double(tapPotatoNumText.text!) ?? 10
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
//    func getQuickPlayTime() -> Double {
//        return quickPlayTime
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
