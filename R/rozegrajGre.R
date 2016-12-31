#' Pojedyncza rozgrywka w SuperFarmera
#'
#' Funkcja przeprowadzająca jedną, jednoosobową grę SuperFarmer do momentu wygranej gracza przy zadanej strategii oraz zadanego stanu początkowego gry.
#'
#' @param strategia Funkcja opisująca zbiór reguł, które reagują na aktualny stan stada gracza i zwraca nowy stan stada po wykonaniu wszystkich wymian zgodnie z zasadami gry.
#' @param stanGry Lista dwóch nazwanych wektorów opisujących aktualny stan gry poprzez podanie liczebności zwierząt w stadzie gracza oraz liczebności zwierząt w banku. Wymagane nazwewnictwo i kolejność zwierząt w wektorach to c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies").
#'
#' @return Liczba tur, jakie były niezbędne do zakończenia gry od zadanego stanu gry, przy wybranej strategii.
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

rozegrajGre<-function(strategia,stanGry){

  liczbaTur    <- 0
  stanGracza   <- stanGry[['stanZagrody']]

  while (czyWygrana(stanGracza) == 0) {

    stanGracza   <- strategia(stanGracza)
    stanGry      <- konwertujStanGraczaNaStanGry(stanGracza)
    stanGry      <- wyliczStanGryPoRzucieKoscmi(stanGry)
    stanGracza   <- stanGry[['stanZagrody']]

    liczbaTur <- liczbaTur + 1

# Wykrywacz beznadziejnych strategii :)
#
#     if (liczbaTur > 1000) {
#       print("Ding!")
#       return(NA)
#     }

  }

  return(liczbaTur)

}
