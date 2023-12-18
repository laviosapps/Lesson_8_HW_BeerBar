
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var turnoverLabel: UILabel!
    @IBOutlet weak var guinnessStock: UILabel!
    @IBOutlet weak var coronaStock: UILabel!
    @IBOutlet weak var goblinStock: UILabel!
    @IBOutlet weak var gambrinusStock: UILabel!
    @IBOutlet weak var hoegardenStock: UILabel!
    @IBOutlet weak var dayResultsLabel: UILabel!
    
    var beerGuinness = Beer(name: "Gueness", price: 5.5, country: "UK", volume: 100)
    var beerCorona = Beer(name: "Corona", price: 4.0, country: "Mexico", volume: 100)
    var beerGoblin = Beer(name: "Goblin", price: 9.5, country: "UK", volume: 100)
    var beerGambrinus = Beer(name: "Gambrinus", price: 6.0, country: "Czech Republic", volume: 100)
    var beerHoegarden = Beer(name: "Hoegarden", price: 5.5, country: "Belgium", volume: 100)
    
    
    
    var beerSoldCounter = 0
    var turnover = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turnoverLabel.text = "0"
        
        dayResultsLabel.isHidden = true
        
        
        
        
       
    }
    
    func beerSold(name: Beer) {
        dayResultsLabel.isHidden = true
        turnover = turnover + name.price
        turnoverLabel.text = String(turnover)
        name.volume -= 1
        beerSoldCounter += 1
        guinnessStock.text = String(beerGuinness.volume)
        coronaStock.text = String(beerCorona.volume)
        goblinStock.text = String(beerGoblin.volume)
        gambrinusStock.text = String(beerGambrinus.volume)
        hoegardenStock.text = String(beerHoegarden.volume)
    }
    
    @IBAction func guinnessBeerPressed(_ sender: Any) {
       beerSold(name: beerGuinness)
        
    }
    
    @IBAction func coronaBeerPressed(_ sender: Any) {
        beerSold(name: beerCorona)
    }
    
    @IBAction func goblinBeerPressed(_ sender: Any) {
        beerSold(name: beerGoblin)
    }
    
    @IBAction func gambrinusBeerPressed(_ sender: Any) {
        beerSold(name: beerGambrinus)
    }

    @IBAction func hoegardenBeerPressed(_ sender: Any) {
        beerSold(name: beerHoegarden)
    }
    
    func stockBack(beerName: Beer) {
            beerName.volume = 100
        }
    
    
    @IBAction func dayDayFinished(_ sender: Any) {
        var beersArray: [Beer] = [beerGuinness, beerCorona, beerGoblin, beerGambrinus, beerHoegarden]
        dayResultsLabel.text = "За день было продано \(beerSoldCounter) литров пива на общую стоимость \(turnover) у.е."
        dayResultsLabel.isHidden = false
        beerSoldCounter = 0
        turnover = 0.0
        for i in 0...4 {
            stockBack(beerName: beersArray[i])
        }
        
        guinnessStock.text = String(beerGuinness.volume)
        coronaStock.text = String(beerCorona.volume)
        goblinStock.text = String(beerGoblin.volume)
        gambrinusStock.text = String(beerGambrinus.volume)
        hoegardenStock.text = String(beerHoegarden.volume)
        
        turnoverLabel.text = "0"
    }
    
    
}

