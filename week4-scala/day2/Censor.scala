import scala.io.Source
import scala.collection.mutable.HashMap

trait Censor {
    val initialAlternatives = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
    val alternatives = initialAlternatives ++ Source.fromFile("censor_alternatives.txt").getLines
        .map(_.split(","))
        .map(array => array(0).trim() -> array(1).trim())
        .toMap

    def censor(sentence: String): String = {
      return (sentence /: alternatives) {(cleanSentence, alternative) => cleanSentence.replace(alternative._1, alternative._2)}
    }
}

object Testing extends Censor
val dirtySentence = "Shoot a Ass. Darn, I missed!"
val cleanSentence = Testing.censor(dirtySentence)
println(cleanSentence)
