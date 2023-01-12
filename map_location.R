# function to plot current location
# on map with stations

# libraries
library(tidyverse)

plot_ship_location <- function(lat, lon) {

  loc <- data.frame(latitude = lat, longitude = lon)
  # get basemap data
  bg = rnaturalearth::ne_countries(scale = "medium", continent = 'north america', returnclass = "sf")


  ggplot()+
    # basemap
    geom_sf(data = bg)+
    coord_sf(xlim = range(eimsr::lter_stations$longitude, na.rm = TRUE),
             ylim = range(eimsr::lter_stations$latitude, na.rm = TRUE),
             expand = FALSE)+
    # LTER stations
    geom_point(data = eimsr::lter_stations,
               aes(x=longitude,y=latitude),
               alpha = 1, shape=21, size = 2)+
    geom_text(data = eimsr::lter_stations,
              aes(x=longitude,y=latitude, label = name),
              hjust = 0, nudge_x = 0.05,
              vjust = 0, nudge_y = 0.05,
              size = 3) +
    # ship location
    geom_point(data = loc,
              aes(x=longitude,y=latitude),
              size = 3,
              alpha = 1) +
    # formatting
    scale_fill_viridis_c(option = "inferno")+
    scale_color_viridis_c(option = "inferno")+
    scale_size_continuous(range = c(0.1,10))+
    theme_dark()+
    theme(panel.grid = element_blank())
}
