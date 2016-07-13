import scala.io.Source
import scala.collection.mutable.HashMap

trait Censor {

    val alternatives = new HashMap[String, String]
    loadFromFile("censor_alternatives.txt")

    def censor(sentence: String): String = {
        var cleanSentence = sentence
        alternatives.foreach { alternative =>
            cleanSentence = cleanSentence.replace(alternative._1, alternative._2)
        }
        return cleanSentence
    }

    def loadFromFile(filename: String) {
        Source.fromFile(filename).getLines.foreach { line =>
            val words = line.split(",")
            alternatives += words(0).trim() -> words(1).trim()
        }
    }
}

object Testing extends Censor
val dirtySentence = "Shoot, Darn"
val cleanSentence = Testing.censor(dirtySentence)
println(cleanSentence)
