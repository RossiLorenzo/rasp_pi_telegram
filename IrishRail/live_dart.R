library(XML)

setwd("/home/pi/Lorenzo/Telegram/IrishRail")
a = xmlToDataFrame("tmp.txt")

if(nrow(a) == 0){
cat('No trains in the next hour', file = 'formatted.txt')
}else{
x = paste0("Northbound:\n", 
       paste0("  ", a$Destination[a$Direction == "Northbound"], ": ", a$Duein[a$Direction == "Northbound"], "m", collapse = "\n"),
       "\nSouthbound:\n",
       paste0("  ", a$Destination[a$Direction == "Southbound"], ": ", a$Duein[a$Direction == "Southbound"], "m", collapse = "\n")
)

cat(x, file = "formatted.txt")
}
