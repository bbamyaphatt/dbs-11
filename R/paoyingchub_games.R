pych_games <- function () {
  cat (paste("Hi! Welcome to the PYCH games! We're glad to meet you here :D","\n" ,
             "In this games, you have to choose the weapons to fight the comp"))
  
  hands <- c("rock","scissors","paper")

  comp_score <- 0
  user_score <- 0
  
  i <- 0
  
  while (i < 10) {
    user_hand <- readline("choose your weapon!; rock, scissors, paper or give up?: ")
    comp_hand <- sample(hands,1)
    if ((user_hand == hands[1] & comp_hand == hands[2]) |
        (user_hand == hands[2] & comp_hand == hands[3]) |
        (user_hand == hands[3] & comp_hand == hands[1]) ) {
      cat (paste0("round:", i + 1,"/10","\n"))
      cat (paste("comp_hand:",comp_hand,"\n"))
      cat ("result: You win!")
      user_score <- user_score + 1
    } else if (user_hand == comp_hand ) {
      cat (paste0("round:", i + 1,"/10","\n"))
      cat (paste("comp_hand:",comp_hand,"\n"))
      cat ("result: Draw!")
     } else if  {
        cat (paste0("round:", i + 1,"/10","\n"))
        cat (paste("comp_hand:", comp_hand,"\n"))
        cat (paste("result: You lose!","\n"))
        comp_score <- comp_score + 1
    } else (user_hand == "give up") {
      break
      cat ("The games is over")
    } 
    i <- i + 1
  }
  if (i == 10) {
    cat (paste("\n","End Games!","Thank you for playing with us!","\n"))
    cat ("The score is...")
    cat (paste("Yours", user_score, ":","Comp's", comp_score,"\n"))
  }
  
  if (user_score > comp_score) {
    cat ("Congratulations! You are the winner!")
  } else {
    cat ("Nice try!")
  }
  
  
}