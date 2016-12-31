## ------------------------------------------------------------------------
library(SuperFarmerKapibary)
stanGry <- c(5,5,5,0,0,0,0)
print(stanGry)
stanGry <- strategia_Pierwsza(stanGry)
print(stanGry)
stanGry <- strategia_Pierwsza(stanGry)
print(stanGry)
stanGry <- strategia_Pierwsza(stanGry)
print(stanGry)


## ------------------------------------------------------------------------
library(SuperFarmerKapibary)
stanGry <- c(5,5,5,0,0,0,0)
print(stanGry)
stanGry <- strategia_Druga(stanGry)
print(stanGry)
stanGry <- strategia_Druga(stanGry)
print(stanGry)
stanGry <- strategia_Druga(stanGry)
print(stanGry)

## ------------------------------------------------------------------------
SuperFarmerKapibary::gra(strategia=SuperFarmerKapibary::strategia_Pierwsza)

## ------------------------------------------------------------------------
SuperFarmerKapibary::gra(strategia=SuperFarmerKapibary::strategia_Druga)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(strategia = SuperFarmerKapibary::strategia_Pierwsza,
                               powt      = 100)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(strategia    = SuperFarmerKapibary::strategia_Druga,
                               powt         = 100,
                               progressBar  = FALSE,
                               statystyki   = FALSE,
                               histogram    = TRUE)

## ------------------------------------------------------------------------
rozklad <- SuperFarmerKapibary::badaj_gre(strategia    = SuperFarmerKapibary::strategia_Druga,
                                          powt         = 100,
                                          progressBar  = FALSE,
                                          statystyki   = FALSE,
                                          zwrocRozklad = TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmer.SuperDziewczyn::strategia_owce,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmer.SuperDziewczyn::strategia_wymian_0_0_0_0,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmer.SuperDziewczyn::strategia_wymian_1_1_1_1,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmerADiPR::strategia_postMDiPR,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmerADiPR::strategia_ADA,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmerMoc::strategia_postMDiPR,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerKapibary::badaj_gre(SuperFarmerMoc::strategia_Jana,
                               powt=100, 
                               progressBar=FALSE, 
                               histogram=TRUE)

## ------------------------------------------------------------------------
SuperFarmerMoc:::gra(SuperFarmerKapibary::strategia_Pierwsza)

## ------------------------------------------------------------------------
SuperFarmerADiPR::gra(SuperFarmerKapibary::strategia_Pierwsza)

## ------------------------------------------------------------------------
SuperFarmer.SuperDziewczyn::gra(SuperFarmerKapibary::strategia_Pierwsza)

## ------------------------------------------------------------------------
SuperFarmer.SuperPakiet::gra(SuperFarmerKapibary::strategia_Pierwsza)

## ------------------------------------------------------------------------
SuperFarmerMoc:::gra(SuperFarmerKapibary::strategia_Druga)

## ------------------------------------------------------------------------
SuperFarmerADiPR::gra(SuperFarmerKapibary::strategia_Druga)

## ------------------------------------------------------------------------
SuperFarmer.SuperDziewczyn::gra(SuperFarmerKapibary::strategia_Druga)

## ------------------------------------------------------------------------
SuperFarmer.SuperPakiet::gra(SuperFarmerKapibary::strategia_Druga)

