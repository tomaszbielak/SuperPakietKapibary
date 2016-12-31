#' Transfer zwierząt do zagrody
#'
#' Niniejsza funkcja przeprowadza operację wymiany zwierząt pomiędzy stadem głównym a stadem gracza
#'
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#' @param wynikRzutuKoscmi Dwuelementowy wektor przyjmujący jako wartości nazwy zwierząt, które zostały wylosowane przy rzucie koścmi.
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

dodajZwierzetaDoZagrody<-function(stanGry,wynikiRzutuKoscmi){

  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  for(zwierze in nazwy){
    if (wynikiRzutuKoscmi[1] == zwierze | wynikiRzutuKoscmi[2] == zwierze) {
      if (wynikiRzutuKoscmi[1] == zwierze & wynikiRzutuKoscmi[2] == zwierze) {
        liczbaZwierzatDoDodania <- floor((stanGry[["stanZagrody"]][zwierze] + 2) / 2)
      }
      else{
        liczbaZwierzatDoDodania <- floor((stanGry[["stanZagrody"]][zwierze] + 1) / 2)
      }

      if(stanGry[["stanBankuZwierzat"]][zwierze]<liczbaZwierzatDoDodania){

        stanGry[["stanZagrody"]][zwierze] <-
          stanGry[["stanZagrody"]][zwierze] + stanGry[["stanBankuZwierzat"]][zwierze]

        stanGry[["stanBankuZwierzat"]][zwierze] <- 0

      }
      else{

        stanGry[["stanZagrody"]][zwierze] <-
          stanGry[["stanZagrody"]][zwierze] + liczbaZwierzatDoDodania

        stanGry[["stanBankuZwierzat"]][zwierze] <-
          stanGry[["stanBankuZwierzat"]][zwierze] - liczbaZwierzatDoDodania

      }

    }
  }
  return(stanGry)
}
