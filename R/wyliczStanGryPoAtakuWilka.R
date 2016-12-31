#' Wyliczenie stanu gry po ataku wilka
#'
#' Niniejsza funkcja aktualizuje stan stada gracza oraz stan głównego stada po wylosowaniu wilka.
#'
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#'
#' @return Funkcja zwraca zaktualizowaną listę stanGry opisującą stan stada gracza oraz stan stada głównego
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

wyliczStanGryPoAtakuWilka <- function(stanGry) {

  #Lista nazw zwierząt, których dotyczy reguła
  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  if (stanGry[["stanZagrody"]]["duzy_pies"] == 0) {
    for (zwierze in nazwy) {
      if (zwierze != "kon" & zwierze != "maly_pies") {
        stanGry[["stanBankuZwierzat"]][zwierze] <-
          stanGry[["stanBankuZwierzat"]][zwierze] + stanGry[["stanZagrody"]][zwierze]
        stanGry[["stanZagrody"]][zwierze] <- 0
      }
    }
  } else {
    stanGry[["stanBankuZwierzat"]]["duzy_pies"] <- stanGry[["stanBankuZwierzat"]]["duzy_pies"] + 1
    stanGry[["stanZagrody"]]["duzy_pies"]       <- stanGry[["stanZagrody"]]["duzy_pies"] - 1
  }

  return(stanGry)
}
