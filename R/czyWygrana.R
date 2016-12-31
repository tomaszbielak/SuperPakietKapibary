#' Weryfikacja warunków końca gry
#'
#' Niniejsza funkcja przeprowadza test, czy nastąpił koniec gry SuperFarmer,
#' tj. czy gracz uzyskał przynajmniej po jednym zwierzęciu
#'
#' @param stanGracza Nazwany wektor liczebności zwierząt w zagrodzie gracza.
#' Nazwy zwierząt i kolejność w wektorze: c("krolik","owca","swinia","krowa","kon","maly_pies","duzy_pies")
#'
#' @return Funkcja zwraca wartość 1 gdy nastąpił koniec gry lub 0 gdy gra ma trwać kolejną rundę.
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

czyWygrana <- function(stanGracza) {
  if (all(stanGracza[1:5] > 0)) {
    return (1)
  } else {
    return (0)
  }
}
