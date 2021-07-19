//
//  ViewController.swift
//  WaveProgressIndicationView
//
//  Created by user195713 on 7/18/21.
//

import UIKit

class ViewController: UIViewController {
    var wave = WaveProgressIndicatorView.init(frame: .zero)
        var isAnimating: Bool = false {
            didSet{
                if isAnimating {
                    self.wave.startAnimation()
                } else {
                    self.wave.stopAnimation()
                }
            }
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            self.wave.waveColor = .red
            self.wave = WaveProgressIndicatorView(frame: self.view.bounds)
            self.wave.center = self.view.center;
            self.view.addSubview(self.wave)
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.updateAnimation))
            self.wave.addGestureRecognizer(tap)
            
            let pan = UIPanGestureRecognizer.init(target: self, action: #selector(ViewController.updatePercent))
            self.wave.addGestureRecognizer(pan)
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        @objc func updatePercent(_ gesture: UIPanGestureRecognizer) {
            if gesture.state == .changed || gesture.state == .ended {
                let location = gesture.location(in: self.wave)
                let percent = 100 - Int(100.0 * location.y / self.wave.bounds.height);
                self.wave.completionInPercent = percent
            }
        }

        @objc func updateAnimation() {
            self.isAnimating = !self.isAnimating
        }
}

