context("wyliczStanGryPoAtakuWilka")

test_that("Wilk zjada zwierzaki",{

  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  stanGracza        <- c(1,2,3,4,1,1,0)
  names(stanGracza) <- nazwy
  stanGry           <- konwertujStanGraczaNaStanGry(stanGracza)

  oczekiwanyStanGracza        <- rep(0, times = 9)
  oczekiwanyStanGracza["kon"] <- 1
  names(oczekiwanyStanGracza) <- nazwy

  zrealizowanyStanGry    <- wyliczStanGryPoAtakuWilka(stanGry)
  zrealizowanyStanGracza <- zrealizowanyStanGry[['stanZagrody']]

  expect_equivalent(zrealizowanyStanGracza, c(0 , 0, 0, 0, 1, 1, 0))
})

test_that("Przed zdjedzeniem chroni duzy_pies",{

  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  stanGracza        <- c(1,2,3,4,1,0,1)
  names(stanGracza) <- nazwy
  stanGry           <- konwertujStanGraczaNaStanGry(stanGracza)

  oczekiwanyStanGracza        <- rep(0, times = 9)
  oczekiwanyStanGracza["kon"] <- 1
  names(oczekiwanyStanGracza) <- nazwy

  zrealizowanyStanGry    <- wyliczStanGryPoAtakuWilka(stanGry)
  zrealizowanyStanGracza <- zrealizowanyStanGry[['stanZagrody']]

  expect_equivalent(zrealizowanyStanGracza, c(1,2,3,4,1,0,0))
})
