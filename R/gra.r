#' Gra SuperFarmer na 1 os. wyposażoną w strategię
#'
#' Niniejsza funkcja ma na celu przeprowadzenie pełnej gry SuperFarmer dla jednego gracza, który posługuje się strategią zdefiniowaną jako argument funkcji.
#'
#' @param strategia Funkcja opisująca zbiór reguł, które reagują na aktualny stan stada gracza i zwraca nowy stan stada po wykonaniu wszystkich wymian zgodnie z zasadami gdy
#'
#' @return Funkcja zwraca liczbę tur, jaka była niezbędna do zakończenia gdy przy zastosowanej strategii
#'
#' @examples
#' gra(strategia_Pierwsza)
#'
#' @export



gra<-function(strategia){

  # Definiejemy nazw zwierząt, ich początkowej liczebności u gracza oraz początkowej liczebności banku
  nazwy               <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")
  stado_gracza        <- c(0,0,0,0,0,0,0)
  stado_bank          <- c(60,24,20,12,6,4,2)
  names(stado_gracza) <- nazwy
  names(stado_bank)   <- nazwy

  # Definiujemy listę przechowującą stan zagrody gracza [1] oraz stan banku zwierząt [2]
  stanGry             <- list(stanZagrody       = stado_gracza,
                              stanBankuZwierzat = stado_bank)

  #definicja zmiennej przechowującej liczbę partii, jaka była potrzebna do zakończenia gry przy danej strategii
  liczba_partii       <- rozegrajGre(strategia, stanGry)

  return(liczba_partii)

}


