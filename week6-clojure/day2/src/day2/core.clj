(ns day2.core)

(defprotocol Vehicle
    (speed [this])
    (accelerate [this])
    (decelerate [this]))

(defrecord Car [speed]
    Vehicle
    (speed [_] speed)
    (accelerate [_] (Car. (+ speed 10)))
    (decelerate [_] (Car. (- speed 10))))

(defmacro unless [test body_false body_true]
    (list 'if (list 'not test) body_false body_true))

(defn -main
  []
  (println (unless true "not this" "this"))
  (println (unless false "this" "not this"))
  (def car (Car. 50))
  (println (speed car))
  (println (speed (accelerate car)))
  (println (speed (decelerate car))))
