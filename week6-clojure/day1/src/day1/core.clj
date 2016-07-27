(ns day1.core)

(defn big
    [st n]
    (> (count st) n))

(defn collection-type
    [col]
    (cond
        (list? col) :list
        (vector? col) :vector
        (map? col) :map))

(defn -main
  []
  (println (big "Hello" 3))
  (println (collection-type '(1 2)))
  (println (collection-type [1 2]))
  (println (collection-type {1 2})))
