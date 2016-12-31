#' Wyliczenie stanu gry po ataku lisa
#'
#' Niniejsza funkcja aktualizuje stan stada gracza oraz stan głównego stada po wylosowaniu lisa
#'
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#'
#' @return Funkcja zwraca zaktualizowaną listę stanGry opisującą stan stada gracza oraz stan stada głównego
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

wyliczStanGryPoAtakuLisa <- function(stanGry) {

  if (stanGry[["stanZagrody"]]["maly_pies"] == 0) {
    stanGry[["stanBankuZwierzat"]]["krolik"] <-
      stanGry[["stanBankuZwierzat"]]["krolik"] + stanGry[["stanZagrody"]]["krolik"]
    stanGry[["stanZagrody"]]["krolik"] <- 0
  }
  else{
    stanGry[["stanBankuZwierzat"]]["maly_pies"] <- stanGry[["stanBankuZwierzat"]]["maly_pies"]+1
    stanGry[["stanZagrody"]]["maly_pies"]       <- stanGry[["stanZagrody"]]["maly_pies"]-1
  }

  return(stanGry)
}
