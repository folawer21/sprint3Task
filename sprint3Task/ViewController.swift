import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var historyLabel: UITextView!
    
    func getDate() -> String{
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let day = calendar.component(.day, from:date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let result = "\(day).\(month).\(year) \(hour):\(minute):\(second)"
        
        return result
    }
    
    var score:Int  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        historyLabel.isEditable = false
        historyLabel.text = "История изменений:\n"
    }
    
    

    @IBAction func minusTapped(_ sender: Any) {
        if score > 0 {
            score -= 1
            historyLabel.text.append("[\(getDate())]: значение изменено на -1 \n")
            scoreLabel.text = "Значение счетчика: \(score)"
           
            
        }
        else {
            historyLabel.text.append("[\(getDate())]: попытка уменьшить значение счётчика ниже 0\n")
        }
        
    }
    
    @IBAction func resetBtnTapped(_ sender: Any) {
    
        score = 0
        historyLabel.text.append("[\(getDate())]: значение сброшено\n")
        scoreLabel.text = "Значение счетчика: \(score)"
        
    }
    
    @IBAction func plusBtnTapped(_ sender: Any) {
        
        score += 1
        historyLabel.text.append("[\(getDate())]: значение изменено на +1 \n")
        scoreLabel.text = "Значение счетчика: \(score)"
    }
}

