library(dplyr)
rankhospital <- function(state, outcome, num = "best") {
        
        outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        Sname <- outcomeData[,"State"]
        caseName <- c("heart attack","heart failure","pneumonia")
        if (state %in% Sname & outcome %in% caseName ) {
                
                Routcome <- subset(outcomeData, State==state)
                if(outcome=="heart attack")
                        {
                                OutcomeData2 <- Routcome[,c(2,11)]
                                OutcomeData2[,2] <- as.numeric(OutcomeData2[,2])
                                bestH <- OutcomeData2[order(OutcomeData2[,2], OutcomeData2[,1]),]
                                bestH1<-bestH[complete.cases(bestH),]
                                if(num =="best")                  bestH1[1,1]
                                else if(num=="worst")             bestH1[dim(bestH1)[1],1]
                                else if(num > (dim(Routcome)[1])) NA
                                else                              bestH1[num,1]
                                        
                        }
                else if(outcome=="heart failure"){
                        
                        OutcomeData2 <- Routcome[,c(2,17)]
                        OutcomeData2[,2] <- as.numeric(OutcomeData2[,2])
                        bestH <- OutcomeData2[order(OutcomeData2[,2], OutcomeData2[,1]),]
                        bestH1<-bestH[complete.cases(bestH),]
                        if(num =="best")                        bestH1[1,1]
                        else if(num=="worst")                   bestH1[dim(bestH1)[1],1]
                        else if(num > (dim(Routcome)[1]))       NA
                        else                                    bestH1[num,1]
                }
                        
                else if(outcome=="pneumonia"){
                        OutcomeData2 <- Routcome[,c(2,23)]
                        OutcomeData2[,2] <- as.numeric(OutcomeData2[,2])
                        bestH <- OutcomeData2[order(OutcomeData2[,2], OutcomeData2[,1]),]
                        bestH1<-bestH[complete.cases(bestH),]
                        if(num =="best")                        bestH1[1,1]
                        else if(num=="worst")                   bestH1[dim(bestH1)[1],1]
                        else if(num > (dim(Routcome)[1]))       NA
                        else                                    bestH1[num,1]

                }
                        
                
        }
        else if (!(state %in% Sname)) stop("invalid state")
        else if (!(outcome %in% caseName)) stop("invalid outcome")
        
        
}
