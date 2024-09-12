import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
    }
    
    var counter:Int = 3
    var seconds:Int = 3
    var timer: Timer?
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var eggImageView: UIImageView!
    
    @IBAction func cookingSegmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            eggImageView.image = #imageLiteral(resourceName: "Soft") ; counter = 3
        case 1:
            eggImageView.image = #imageLiteral(resourceName: "Medium") ; counter = 5
        case 2:
            eggImageView.image = #imageLiteral(resourceName: "hard") ; counter = 8
        default:
            print("Error")
        }
        
        seconds = counter
        progressBar.progress = 0.0
        resultLabel.text = ""
        
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        
        if timer != nil {
            timer?.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if counter >= 0 {
            progressBar.progress = 1.0 - Float(counter)/Float(seconds)
            counter-=1
        }else{
            resultLabel.text = "Time is over"
            timer?.invalidate()
        }
        
    }
    
    
}

