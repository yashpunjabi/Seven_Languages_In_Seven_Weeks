secret := Random value(100) ceil
"secret " print
secret println
stdin := File standardInput

guess := -1
i := 0

while(secret != guess and i < 10,
    "What is you guess: " print;
    guess = stdin readLine asNumber;
    diff := secret - guess;
    diff = diff abs;
    "diff " print
    diff println
    if (diff > 65, "Very cold" println,
        if (diff > 45, "Cold" println,
            if (diff > 25, "Warm" println,
                if (diff > 10, "Hot" println, "Very hot" println)
            )
        )
    )
    i = i + 1;
)

if (guess != secret, "No bueno" println, "Congratulations" println)
