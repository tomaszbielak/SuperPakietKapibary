#' Wymiana zwierząt
#'
#' Niniejsza funkcja wykonuje wymianę pomiędzy stadem gracza a sta
#'
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#'
#' @return Funkcja zwraca zaktualizowaną listę stanGry opisującą stan stada gracza oraz stan stada głównego
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

sprzedajZwierze<-function(stanGry,zwierzeDoSprzedania,zwierzeDoKupienia){

  liczba       <-sprawdzCene(zwierzeDoSprzedania,zwierzeDoKupienia)
  liczbaWBanku <-stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]

  stanGry[["stanZagrody"]][zwierzeDoSprzedania]       <- stanGry[["stanZagrody"]][zwierzeDoSprzedania] - 1
  stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania] <- stanGry[["stanBankuZwierzat"]][zwierzeDoSprzedania] + 1
  stanGry[["stanZagrody"]][zwierzeDoKupienia]         <- stanGry[["stanZagrody"]][zwierzeDoKupienia] + min(liczba, liczbaWBanku)
  stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia]   <- stanGry[["stanBankuZwierzat"]][zwierzeDoKupienia] - min(liczba, liczbaWBanku)

  return(stanGry)

}
