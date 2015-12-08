library(httr)

# London - 2648110
# Dublin - 7778677
# Pisa - 6542122
# Warsaw - 756135
token = readLines("/home/pi/apikeys/weather.txt")[1]
ids = c(2648110, 7778677, 756135, 6542122)
url = modify_url("http://api.openweathermap.org/data/2.5/group",
                 query = list(id = paste0(ids, collapse = ","),
                              APPID = token))
get_id = GET(url)
get_id = content(get_id)
all_results = get_id$list
all_results = do.call(rbind, lapply(all_results, function(i){
  data.frame(Name = i$name, 
             Weather = i$weather[[1]]$description, 
             Temperature = paste0(i$main$temp - 273.15, "C"),
             Wind = paste0(i$wind$speed * 3.6, "kmh"),
             Humidity = paste0(i$main$humidity, "%"),
             stringsAsFactors = FALSE)
}))

if(nrow(all_results) == 0){
cat('No data available', file = '/home/pi/Lorenzo/Telegram/Weather/weather.txt')
}else{
x = paste0(all_results$Name, ": ", all_results$Weather, "\nTemperature ", all_results$Temperature, "\nWind speed ", all_results$Wind, "\nHumidity ", all_results$Humidity, collapse = "\n\n")
cat(x, file = "/home/pi/Lorenzo/Telegram/Weather/weather.txt")
}

