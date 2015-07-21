

best <- function(state, outcome) {
        outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        Sname <- outcomeData[,"State"]
        caseName <- c("heart attack","heart failure","pneumonia")
        if (state %in% Sname & outcome %in% caseName ) 
        {
                Routcome <- subset(outcomeData, State==state)
                if(outcome=="heart attack")
                        OutcomeData2 <- Routcome[,c(2,11)]
                else if(outcome=="heart failure")
                        OutcomeData2 <- Routcome[,c(2,17)]
                else if(outcome=="pneumonia")
                        OutcomeData2 <- Routcome[,c(2,23)]
                OutcomeData2[,2] <- as.numeric(OutcomeData2[,2])
                bestH<-subset(OutcomeData2, OutcomeData2[,2]==min(OutcomeData2[,2], na.rm=T))
                bestH <- bestH[order(bestH[,1]),]
                bestH[,1]
        }
        else if (!(state %in% Sname)) stop("invalid state")
        else if (!(outcome %in% caseName)) stop("invalid outcome")
}