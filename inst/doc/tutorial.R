## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

load("my_campaignmanager_data.RData")

## ----setup--------------------------------------------------------------------
library(campaignmanageR)

library(dplyr)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  
#  my_campaignmanager_data <-
#    get_campaignmanager_data(api_key = "your api key",
#             date_from = Sys.Date()-100,
#             date_to = Sys.Date(),
#             fields = c("campaign", "clicks",
#                        "spend", "impressions", "date"))

## -----------------------------------------------------------------------------
str(my_campaignmanager_data)

## -----------------------------------------------------------------------------
ggplot(my_campaignmanager_data, aes(y = clicks, fill = campaign)) + geom_boxplot()

## -----------------------------------------------------------------------------
lmod <- glm(clicks ~ campaign, data = my_campaignmanager_data, family = "poisson")
summary(lmod)

