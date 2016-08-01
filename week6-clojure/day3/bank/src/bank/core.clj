(ns bank.core)

(defn pay [balances from to amount]
    (dosync
        (alter balances merge {from (- (@balances from) amount)})
        (alter balances merge {to (+ (@balances to) amount)})))

(defn -main []
  (def accounts [:chase :chris :jeremy :ryan :varun :yash])
  (def balances (ref {:chase 100, :chris 200, :jeremy 150, :ryan 0, :varun 108, :yash 150}))
  (println @balances)
  (pay balances :yash :ryan 50)
  (println @balances))
