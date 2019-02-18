//
//  ViewController.swift
//  WeatherApp
//
//  Created by Haya on 2/16/18.
//  Copyright © 2018 Haya. All rights reserved.
//

import UIKit
import Alamofire
let cities = ["karachi","islamabad","multan","lahore","peshawar","quetta"]
var city:Array<String> = []
class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet var airpressure: UILabel!
    
    @IBOutlet var Temperature: UILabel!
    @IBOutlet var Location: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        weather.downloadData {
            self.updateUI()
            self.Picker.delegate = self
            self.Picker.dataSource = self
           // self.weather.url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=karachi&appid=a7bbbd5e82c675f805e7ae084f742024")!
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var weather = DataModell()

  
    func updateUI() {
        Temperature.text = "\(weather.temp)"
        Location.text = weather.location
    }
    @IBOutlet var Picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return cities[row]
    

    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) ->String{
       // print(cities[row])
        
        weather.downloadData {
                 var temp = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cities[row])&appid=a7bbbd5e82c675f805e7ae084f742024")!
            self.weather.url = temp
        self.updateUI()
            self.Location.text = cities[row]
       }
        return cities[row]
    }

    }

class DataModell {
    
    private var _temp: String?
    private var _location: String?
    private var _weather: String?
    typealias JSONStandard = Dictionary<String, AnyObject>
    
 //   var city = cities
var url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=karachi&appid=a7bbbd5e82c675f805e7ae084f742024")!
    
var temp: String {
        return _temp ?? "0 °C"
    }
    
    var location: String {
        return _location ?? "Location Invalid"
    }
    
    var weather: String {
        return _weather ?? "Weather Invalid"
    }
    

    func downloadData(completed: @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            if let dict = result.value as? JSONStandard, let main = dict["main"] as? JSONStandard, let temp = main["temp"] as? Double, let weatherArray = dict["weather"] as? [JSONStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JSONStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double {
                
                self._temp = String(format: "%.0f °C", temp - 273.15)
                self._weather = weather
                self._location = "\(name), \(country)"
                
             
            }
            
            completed()
        })
        }}
