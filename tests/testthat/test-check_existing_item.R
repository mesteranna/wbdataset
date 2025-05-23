test_that("check_existing_item() works", {
  test <- check_existing_item(
    search_term = "Estonian National Museum",
    language = "en"
  )
  expect_true(inherits(test, "data.frame"))
  expect_equal(
    as.character(test$rowid),
    "wbi:Q1370397"
  )
})

test_that("check_existing_item() returns correct match when unambiguous", {
  result <- check_existing_item(
    search_term = "Estonian National Museum",
    language = "en",
    wikibase_api_url = "https://www.wikidata.org/w/api.php"
  )
  expect_true(inherits(result, "data.frame"))
  expect_equal(as.character(result$rowid), "wbi:Q1370397")
})

test_that("check_existing_item() returns NULL when ambiguous and return_first is FALSE", {
  result <- check_existing_item(
    search_term = "Orange",
    language = "en",
    wikibase_api_url = "https://www.wikidata.org/w/api.php",
    ambiguity_handling = "return_null"
  )
  expect_null(result)
})

test_that("check_existing_item() returns NULL for ambiguous term with 'return_null' strategy", {
  result <- check_existing_item(
    search_term = "Orange",
    language = "en",
    wikibase_api_url = "https://www.wikidata.org/w/api.php",
    ambiguity_handling = "return_null"
  )
  expect_null(result)
})

test_that("check_existing_item() returns first match for ambiguous term with 'return_first' strategy", {
  result <- check_existing_item(
    search_term = "Orange",
    language = "en",
    wikibase_api_url = "https://www.wikidata.org/w/api.php",
    ambiguity_handling = "return_first"
  )
  expect_true(inherits(result, "data.frame"))
  expect_true("rowid" %in% names(result))
})


test_that("check_existing_item() handles invalid inputs appropriately", {
  # Test for non-character search_term
  expect_error(
    check_existing_item(search_term = 123, language = "en"),
    "Invalid input: 'search_term' must be a non-empty character string.",
    fixed = TRUE
  )

  # Test for empty search_term
  expect_error(
    check_existing_item(search_term = "", language = "en"),
    "Invalid input: 'search_term' must be a non-empty character string.",
    fixed = TRUE
  )

  # Test for non-character language
  expect_error(
    check_existing_item(search_term = "Estonian National Museum", language = 123),
    "Invalid input: 'language' must be a non-empty character string.",
    fixed = TRUE
  )

  # Test for empty language
  expect_error(
    check_existing_item(search_term = "Estonian National Museum", language = ""),
    "Invalid input: 'language' must be a non-empty character string.",
    fixed = TRUE
  )

  # Test for invalid wikibase_api_url
  expect_error(
    check_existing_item(search_term = "Estonian National Museum", language = "en", wikibase_api_url = "invalid_url"),
    "Invalid input: 'wikibase_api_url' must be a valid URL string.",
    fixed = TRUE
  )
})
