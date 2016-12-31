#' Badanie wyników gry
#'
#' Funkcja powtarzającą model gry SuperFarmer z zadaną strategią 10000 razy i wyznaczającą podstawowe statystyki opisowe rozkładu wyników
#'
#' @param strategia Strategia, którą będziemy testować.
#' @param powt Liczba badanych gier.
#' @param progressBar Gdy TRUE wyświetlany jest pasek postępu, gdy FALSE paska nie ma.
#' @param histogram Gdy TRUE wyświetlany jest histogram wyników, gdy FALSE histogramu nie ma.
#' @param statystyki Gdy TRUE wyświetlane są statystyki rozkłądu wyników, gdy FALSE to nie.
#' @param zwrocRozklad Gdy TRUE funkcja zwraca nazwany wektor statystyk opisowych.
#'
#' @author Tomasz Bielak \email{tomasz.bielak@student.uw.edu.pl}
#' @author Michał Kotlewski \email{tomasz.bielak@student.uw.edu.pl}
#'
#' @export

badaj_gre<-function(strategia,powt=100,progressBar=FALSE, histogram=FALSE, statystyki=TRUE, zwrocRozklad=FALSE){

  if (progressBar) {

    wektorCzasowGry <- c()
    pb <- txtProgressBar(min = 0, max = powt, style = 3)

    for (i in 1:powt) {
      wektorCzasowGry[i] <- gra(strategia)
      setTxtProgressBar(pb, i)
    }
  } else {
    wektorCzasowGry <- replicate(powt, gra(strategia))
  }

  if (statystyki) {
    print(summary(wektorCzasowGry))
  }

  if (histogram) {
    hist(wektorCzasowGry,xlab="Czasy gry")
  }

  if (zwrocRozklad) {
    return(summary(wektorCzasowGry))
  }

}




