context("rzucKoscmi")

test_that("Wynik rzutu jest wektorem",{
  expect_true(is.vector(rzucKoscmi()))
})

test_that("Wektor rzutu kostką ma długość 2",{
  expect_true(length(rzucKoscmi()) == 2)
})
