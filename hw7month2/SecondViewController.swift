import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var personView: UIView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    
    var dataImage: UIImage? = nil
    var dataName: String? = nil
    var dataHeight: Int? = nil
    var dataAge: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        personView.layer.cornerRadius = 30
        
        nameLabel.text = "Имя: \(dataName!)"
        personImageView.image = dataImage
        ageLabel.text = "Возвраст: \(dataAge!)"
        heightLabel.text = "Рост: \(dataHeight!)"
    }

}
