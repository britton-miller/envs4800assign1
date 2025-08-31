#Assignment 1: Britton Miller 
install.packages("sf")
library(sf)
install.packages("ggplot2")
library(ggplot2)
#insert Mexico map
world_map_data <- map_data("world", region = "Mexico")
ggplot(data = world_map_data, aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", fill = "lightgray")
#insert data (shapefile)
shapefile <- st_read("/Users/brittonmiller/Downloads/hotosm_mex_railways_points_shp")
plot(st_geometry(shapefile), col = "green", border = "blue", main = "Railways of Mexico")
#railways are plotted as dots 
#need to overlay basic map of Mexico to show border 
#dots are effective as they show rail stations, 
#which are likely to be clustered around important locales 
#known as "Nodes" in railroad terms 
install.packages("maps")
library(maps)
#overlay 
ggplot() +
  geom_polygon(data = world_map_data, aes(x = long, y = lat, group = group), fill = "lightgray", color = "darkgray") +
  geom_sf(data = shapefile, aes(color = railway), alpha = 0.7) +
    theme_minimal() +
    labs(title = "Railway Stations of Mexico (Nodes)")



