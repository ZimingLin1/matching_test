# some error occured when installing sl3... This code is for trying to fix that error
# this chunk is for removing all the packages installed
#
# ip <- as.data.frame(installed.packages())
# head(ip)
# # if you use MRO, make sure that no packages in this library will be removed
# ip <- subset(ip, !grepl("MRO", ip$LibPath))
# # we don't want to remove base or recommended packages either\
# ip <- ip[!(ip[,"Priority"] %in% c("base", "recommended")),]
# # determine the library where the packages are installed
# path.lib <- unique(ip$LibPath)
# # create a vector with all the names of the packages you want to remove
# pkgs.to.remove <- ip[,1]
# head(pkgs.to.remove)
# # remove the packages
# sapply(pkgs.to.remove, remove.packages, lib = path.lib)

rm(list = ls())
graphics.off()
#install/load relevant packages
list.of.packages <- c("tidyverse","caret","xgboost","bootstrap","mgcv","remotes", "FNN", "splines")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, type="binary")
lapply(list.of.packages, library, character.only = TRUE)

#######################################

num_files <- 34
file_names <- paste0("results_", 1916+1:num_files, ".csv")

data_list <- list()

for (i in 1:length(file_names)) {
  file_path <- file_names[i]
  data_list[[i]] <- read.csv(file_path)
}

combined_data <- do.call(rbind, data_list)

  








