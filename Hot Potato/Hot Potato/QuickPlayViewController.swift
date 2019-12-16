//
//  QuickPlayViewController.swift
//  Hot Potato
//
//  Created by Luther Yu on 12/5/19.
//  Copyright © 2019 Luther Yu. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData
import AudioToolbox

class QuickPlayViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var hotpotato: UIImageView!
    @IBOutlet weak var coldpotato: UIImageView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var fetchRequest: NSFetchRequest<UserSettings>!
    var fireburning: AVAudioPlayer?
    var clockticking: AVAudioPlayer?

    override func viewDidLoad() {
        hotpotato.isHidden = true
        coldpotato.isHidden = true
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //google swift user defaults

    
    @IBAction func quickPlayStartButton(_ sender: UIButton) {
        button1.isHidden = true
        label1.isHidden = true
        coldpotato.isHidden = false
        var seconds = 10.0
        do{
            fetchRequest = UserSettings.fetchRequest()
            let settings = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            //            self.settings = settings
            if(settings.count > 0){
                seconds = Double(settings[0].hotPotatoInput)
            }
        }catch{
            
        }
        
        let path2 = Bundle.main.path(forResource: "clockticking", ofType:"mp3")!
        let url2 = URL(fileURLWithPath: path2)
        do {
            self.clockticking = try AVAudioPlayer(contentsOf: url2)
//            self.clockticking?.numberOfLoops = -1
            self.clockticking?.play()
        } catch {
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            self.coldpotato.isHidden = true
            self.hotpotato.isHidden = false
            
            DispatchQueue.global().async {

                let path = Bundle.main.path(forResource: "fireburning", ofType:"mp3")!
                let url = URL(fileURLWithPath: path)
                do {
                    self.clockticking?.stop()
                    self.fireburning = try AVAudioPlayer(contentsOf: url)
                    self.fireburning?.play()
                    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                } catch {
                }

            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         NotificationCenter.default.removeObserver(self)
        if clockticking != nil{
            clockticking = nil
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
