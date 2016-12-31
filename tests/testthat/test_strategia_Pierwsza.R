context("strategia_Pierwsza")

test_that("Wektor wynikowy ma odpowiednie nazwy", {

  stanGraczaPrzedStrategia <- c(4,1,2,0,0,0,0)
  stanGraczaPoStrategii    <- strategia_Pierwsza(stanGraczaPrzedStrategia)
  expect_true(all(names(stanGraczaPoStrategii) == c("krolik","owca","swinia", "krowa", "kon", "maly_pies","duzy_pies")))

})

