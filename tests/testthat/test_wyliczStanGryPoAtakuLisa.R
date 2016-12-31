context("wyliczStanGryPoAtakuLisa")

test_that("Lis zjada króliki",{

  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  stanGracza        <- c(1,2,3,4,1,0,0)
  names(stanGracza) <- nazwy
  stanGry           <- konwertujStanGraczaNaStanGry(stanGracza)

  oczekiwanyStanGracza        <- rep(0, times = 9)
  oczekiwanyStanGracza["kon"] <- 1
  names(oczekiwanyStanGracza) <- nazwy

  zrealizowanyStanGry    <- wyliczStanGryPoAtakuLisa(stanGry)
  zrealizowanyStanGracza <- zrealizowanyStanGry[['stanZagrody']]

  expect_equivalent(zrealizowanyStanGracza, c(0 , 2, 3, 4, 1, 0, 0))
})

test_that("Przed zdjedzeniem królików chroni maly_pies",{

  nazwy <- c("krolik", "owca", "swinia", "krowa", "kon", "maly_pies", "duzy_pies")

  stanGracza        <- c(1,2,3,4,1,1,0)
  names(stanGracza) <- nazwy
  stanGry           <- konwertujStanGraczaNaStanGry(stanGracza)

  oczekiwanyStanGracza        <- rep(0, times = 9)
  oczekiwanyStanGracza["kon"] <- 1
  names(oczekiwanyStanGracza) <- nazwy

  zrealizowanyStanGry    <- wyliczStanGryPoAtakuLisa(stanGry)
  zrealizowanyStanGracza <- zrealizowanyStanGry[['stanZagrody']]

  expect_equivalent(zrealizowanyStanGracza, c(1,2,3,4,1,0,0))
})
