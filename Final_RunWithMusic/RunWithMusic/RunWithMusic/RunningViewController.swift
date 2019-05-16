//
//  RunningViewController.swift
//  RunWithMusic
//
//  Created by Jiayin Liu on 12/8/18.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import CoreMotion
import CoreML

class RunningViewController: UIViewController {
    var musicTalbleVC: MuiscListViewController!
    private var mainVC: MainMusicViewController!
    
    fileprivate var modalVC :DetailMusicViewController!
    private var animator : ARNTransitionAnimator?
    var musicModel:Music?
    var musicArry:Array<Music>!
    var musicnumber:Int!
    var nowNum:Int!
    
    var cadenceArray: [Double] = []
    var count = 1
    var ringBuffer = RingBuffer()
    let activityManager = CMMotionActivityManager()
    let pedometer = CMPedometer()
    var modelRf = RandomForestAccel()
    
    @IBOutlet weak var predictResult: UILabel!
    @IBOutlet weak var currentCadenceLabel: UILabel!
    @IBOutlet weak var dataStatus: UILabel!
    @IBOutlet weak var musicList: UITextField!
    @IBOutlet weak var RunningDistance: UILabel!
    @IBOutlet weak var AveragePace: UILabel!
    
    var isCadenceAvailable:Bool {
        get { return CMPedometer.isCadenceAvailable() }
    }
    
    var isDistanceAvailable:Bool {
        get { return CMPedometer.isDistanceAvailable() }
    }
    
    var isPaceAvailable:Bool {
        get { return CMPedometer.isPaceAvailable() }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.musicArry=Music.getALL()
       
        }

        // Do any additional setup after loading the view.
    func startPedometerCadenceMonitoring(){
        //separate out the handler for better readability
        if CMPedometer.isCadenceAvailable(){
            pedometer.startUpdates(from: Date(),
                                   withHandler: handlePedometer)
        }
        //        if CMPedometer.isPaceAvailable(){
        //            pedometer.startUpdates(from: Date(),
        //                                   withHandler: handlePedometer)
        //        }
    }
    
    func handlePedometer(_ pedData:CMPedometerData?, error:Error?)->(){
        if let currentCadence = pedData?.currentCadence{
            //self.RunningCadence.text = "Cadence : \(pedData?.currentCadence ?? 0)"
            let dCadence = Double(currentCadence)
            NSLog("***************currentCadence  %f", dCadence)
            var RunBPM:Double = 60.0 * dCadence
            cadenceArray.append(RunBPM)
            self.ringBuffer.addNewData(xData: RunBPM)
            DispatchQueue.main.async {
                self.currentCadenceLabel.text = String (RunBPM)
            }
            
            if( cadenceArray.count == 20){
                stopUpdates()
                DispatchQueue.main.async {
                    self.dataStatus.text = "dataset" + String(self.count) + " collection finished! "
                }
                //cadenceArray = []
                NSLog(" finish collecting test1 data ")
                
                // predict
                let seq = toMLMultiArray(self.ringBuffer.getDataAsVector())
                guard let outputRf = try? modelRf.prediction(input: seq) else {
                    fatalError("Unexpected runtime error.")
                }
                DispatchQueue.main.async {
                    self.predictResult.text = String(outputRf.classLabel)
                }
                NSLog("prediction result  %d", outputRf.classLabel)
            }
        }
        
        //        if let currentPace = pedData?.currentPace{
        //            self.RunningPace.text = "Pace : \(pedData?.currentPace ?? 0)"
        //            NSLog("*************currentPace  %f", currentPace)
        //        }
    }
    func stopUpdates(){
        pedometer.stopUpdates()
    }
    
    // convert to ML Multi array
    // https://github.com/akimach/GestureAI-CoreML-iOS/blob/master/GestureAI/GestureViewController.swift
    private func toMLMultiArray(_ arr: [Double]) -> MLMultiArray {
        guard let sequence = try? MLMultiArray(shape:[20], dataType:MLMultiArrayDataType.double) else {
            fatalError("Unexpected runtime error. MLMultiArray could not be created")
        }
        let size = Int(truncating: sequence.shape[0])
        for i in 0..<size {
            sequence[i] = NSNumber(floatLiteral: arr[i])
        }
        return sequence
    }

    
    
//    func startPedometerMonitoring(){
//        //separate out the handler for better readability
//        if CMPedometer.isDistanceAvailable(){
//            pedometer.startUpdates(from: Date(),
//                                   withHandler: handlePedometer)
//        }
//        if CMPedometer.isPaceAvailable(){
//            pedometer.startUpdates(from: Date(), withHandler: handlePedometer)
//        }
//    }
//
//    func handlePedometer(_ pedData:CMPedometerData?, error:Error?)->(){
//        if let totalDistance = pedData?.currentPace{
//            self.RunningDistance.text = "Distance : \(pedData?.distance ?? 0)"
//            NSLog("*************currentPace  %f", totalDistance)
//        }
//        if let AveragePace = pedData?.averageActivePace{
//            self.AveragePace.text = "Distance : \"
//        }
//        
//        
//        
//    }
    
    
    @IBAction func musicChooseButton(_ sender: UIButton) {
        NSLog("Start collecting! ")
        cadenceArray = []
        startPedometerCadenceMonitoring()
        self.musicnumber = Int(predictResult.text!)
        self.nowNum=self.musicnumber-1
        if self.musicnumber>=self.musicArry.count{
            self.nowNum=1
        }
        if AudioPlayer.nextsong(num: self.nowNum){
            
            //  reflashView(num: self.nowNum)
        }
    }
    
//        let sender=sender as! UIButton
//        musicModel?.musicNum = musicnumber
//        if AudioPlayer.activeSong() != nil {
//            if AudioPlayer.activeSong() == musicModel {
//                musicModel?.isActive = true
//                    if AudioPlayer.play(){
//                        sender.setImage(#imageLiteral(resourceName: "stopMusic"), for: .normal)
//                    }else{
//                        sender.setImage(#imageLiteral(resourceName: "playmusic"), for: .normal)
//                    }
//        if AudioPlayer.activeSong() != nil {
//            if AudioPlayer.activeSong() == musicModel {
//                musicModel?.isActive = true
//
//
//                }
//                }
//
//
//
//
   }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */





