import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: CustomButton!
    var questions = Question.questions()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButton.setRedBackground()
        
        questions.forEach {
            print($0.level, $0.ask)
        }
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let viewcontroller = LoseViewController(nibName: "LoseViewController", bundle: nil)
        viewcontroller.modalPresentationStyle = .fullScreen
        viewcontroller.view.backgroundColor = .red
        self.present(viewcontroller, animated: true)
    }
}

