#' Strategia Pierwsza
#'
#' Pierwsza zaimplementowana strategia gry jednego gracza w SuperFarmera.
#'
#' @param stanGracza Nazwany wektor liczebności zwierząt w zagrodzie gracza.
#' Nazwy zwierząt i kolejność w wektorze: c("krolik","owca","swinia","krowa","kon","maly_pies","duzy_pies")
#'
#' @return Strategia zwraca wektor stanGracza po wykonaniu zmian zapisanych w strategii
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

strategia_Pierwsza<-function(stanGracza){

  stanGry <- konwertujStanGraczaNaStanGry(stanGracza)
  stanGry <- wymieniajZwierzetaZgodnieZeStrategia1(stanGry)

  stanGracza <- stanGry[['stanZagrody']]

  return(stanGracza)

}

konwertujStanGraczaNaStanGry <- function (stanGracza) {

  stadoPoczatkoweBank  <- c(60, 24, 20, 12, 6, 4, 2)
  stadoBank            <- stadoPoczatkoweBank - stanGracza

  names                <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")
  names(stadoBank)     <- names
  names(stanGracza)    <- names

  stanGry <- list(stanZagrody=stanGracza,stanBankuZwierzat=stadoBank)

  return(stanGry)

}

sprawdzCene <-
  function(zwierzeDrozsze, zwierzeTansze) {
    cenyZwierzat <- c( krolik=1, owca=6, swinia=12, krowa=36, kon=72, maly_pies=6, duzy_pies=36)
    ###dla rownych cen kolejnosc dowolna
    return(unname(cenyZwierzat[zwierzeDrozsze] / cenyZwierzat[zwierzeTansze]))
  }

kupZwierze<-function(stanGry,zwierzeDoKupienia,zwierzeDoSprzedania){

  liczba <- sprawdzCene(zwierzeDoKupienia,zwierzeDoSprzedania)

  stanGry[["stanZagrody"]][zwierzeDoKupienia]         <-stanGry[["stanZagrody"]][zwierzeDoKupienia]+1
  stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]   <-stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]-1
  stanGry[["stanZagrody"]][zwierzeDoSprzedania]       <-stanGry[["stanZagrody"]][zwierzeDoSprzedania]-liczba
  stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania] <-stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania]+liczba

  return(stanGry)

}

wymieniajZwierzetaZgodnieZeStrategia1 <- function(stanGry) {

  i = 0

  if (stanGry[["stanZagrody"]]["krowa"] > 2 &
      i == 0 & stanGry[["stanBankuZwierzat"]]["kon"] > 1) {
    stanGry <- kupZwierze(stanGry, "kon", "krowa")
    i <- 1
  }
  if (stanGry[["stanZagrody"]]["swinia"] > 3 &
      i == 0 & stanGry[["stanBankuZwierzat"]]["krowa"] > 1) {
    stanGry <- kupZwierze(stanGry, "krowa", "swinia")
    i <- 1
  }
  if (stanGry[["stanZagrody"]]["owca"] > 2 &
      i == 0 & stanGry[["stanBankuZwierzat"]]["swinia"] > 1) {
    stanGry <- kupZwierze(stanGry, "swinia", "owca")
    i <- 1
  }
  if (stanGry[["stanZagrody"]]["krolik"] > 6 &
      i == 0 & stanGry[["stanBankuZwierzat"]]["owca"] > 1) {
    stanGry <- kupZwierze(stanGry, "owca", "krolik")
    i <- 1
  }

  return(stanGry)

}

sprzedajZwierze<-function(stanGry,zwierzeDoSprzedania,zwierzeDoKupienia){

  liczba       <-sprawdzCene(zwierzeDoSprzedania,zwierzeDoKupienia)
  liczbaWBanku <-stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]

  stanGry[["stanZagrody"]][zwierzeDoSprzedania]       <- stanGry[["stanZagrody"]][zwierzeDoSprzedania] - 1
  stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania] <- stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania] + 1
  stanGry[["stanZagrody"]][zwierzeDoKupienia]         <- stanGry[["stanZagrody"]][zwierzeDoKupienia] + min(liczba, liczbaWBanku)
  stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]   <- stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia] - min(liczba, liczbaWBanku)

  return(stanGry)

}
