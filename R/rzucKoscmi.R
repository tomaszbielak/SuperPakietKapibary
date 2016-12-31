#' Implementacja rzutu kośćmi
#'
#' Niniejsza funkcja przeprowadza losowanie dwoma kostkami do gry SuperFarmer. Specyfikacja kostek zgodna
#' z instrukcją gry:
#' Kostka zielona: 6 x Królik, 3 x Owca, 1 x Świnia, 1 x Krowa, 1 x Mały pies
#' Kostka czerwona: 6 x Królik, 2 x Owca, 1 x Krowa, 1 x Duży pies
#'
#' @param None
#'
#' @return Funkcja zwraca dwuelementowy wektor wyników, który jako wartości przyjmuje nazwy zwierząt zgodnie
#' z przyjętą konwencją nazewnictwa: c("krolik","owca","swinia","krowa","kon","maly_pies","duzy_pies","wilk","lis")
#'
#' @examples
#' rzucKoscmi()
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

rzucKoscmi<-function(){

  kostka_zielona      <- c(6,3,1,1,0,0,0,1,0)
  kostka_czerwona     <- c(6,2,2,0,1,0,0,0,1)

  names(kostka_zielona)     <- c("krolik","owca","swinia","krowa","kon","maly_pies","duzy_pies","wilk","lis")
  names(kostka_czerwona)    <- c("krolik","owca","swinia","krowa","kon","maly_pies","duzy_pies","wilk","lis")

  wynik<-c(
    sample(names(kostka_zielona),  1, TRUE, prob=kostka_zielona),
    sample(names(kostka_czerwona), 1, TRUE, prob=kostka_czerwona)
  )

  return(wynik)

}
