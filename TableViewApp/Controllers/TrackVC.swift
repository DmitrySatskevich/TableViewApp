//
//  TrackVC.swift
//  TableViewApp
//
//  Created by dzmitry on 3.12.22.
//

import UIKit
import AVKit

class TrackVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    var track: Track?
    var playerViewController: AVPlayerViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AVPlayerViewController {
            playerViewController = vc
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = track?.name
        imageView.image = UIImage(named: track?.name ?? "")
        
        guard let url = Bundle.main.url(forResource: track?.name, withExtension: track?.ext) else {
            return
        }
        let player = AVPlayer(url: url)
        playerViewController?.player = player
        
    }
    
    @IBAction func startButton() {
        playerViewController?.player?.play()
    }
    
    @IBAction func pauseButton() {
        playerViewController?.player?.pause()
    }
    
    
}
