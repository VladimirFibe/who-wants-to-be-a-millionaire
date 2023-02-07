import Foundation

struct Question: Decodable {
    let level: Int
    let ask: String
    let correctAnswer: String
    let wrongAnswers: [String]
    
    static func questions() -> [Question] {
        if let url = Bundle.main.url(forResource: "questions",
                                     withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                var questions = try decoder.decode([Question].self,
                                                   from: data)
                questions.shuffle()
                var fifteen: [Question] = []
                for i in 1...15 {
                    if let question = questions.first(where: { $0.level == i }) {
                        fifteen.append(question)
                    }
                }
                return fifteen
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
}
