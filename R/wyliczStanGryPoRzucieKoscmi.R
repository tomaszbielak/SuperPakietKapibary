#' Wyliczenie stanu gry po rzucie kośćmi
#'
#' Niniejsza funkcja aktualizuje stan stada gracza oraz stan głównego stada po wykonaniu losowania kostkami.
#'
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#'
#' @return Funkcja zwraca zaktualizowaną listę stanGry opisującą stan stada gracza oraz stan stada głównego
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

wyliczStanGryPoRzucieKoscmi <- function(stanGry) {

  wynikiRzutuKoscmi <- rzucKoscmi()
  stanGry           <- dodajZwierzetaDoZagrody(stanGry,wynikiRzutuKoscmi)

  if (wynikiRzutuKoscmi[1] == "wilk") {
    stanGry <- wyliczStanGryPoAtakuWilka(stanGry)
  }

  if (wynikiRzutuKoscmi[2] == "lis") {
    stanGry <- wyliczStanGryPoAtakuLisa(stanGry)
  }

  return(stanGry)
}
