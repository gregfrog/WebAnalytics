library(testthat)
library(WebAnalytics)
library(fs)

test_that("pdf is generated from sample data", {
  local_edition(3)
  skip_on_cran()
  wkdir = paste0(tempdir(),"/testpdf/")
  workingDirectoryPopulate(wkdir)
  expect_snapshot(system(paste0("cmd /c cd ", wkdir, "& dir& powershell -f makerpt.ps1 sample")))
  skip_on_os("mac")
  skip_on_os("linux")
  skip_on_os("solaris")
  pdfName = list.files(wkdir,pattern=".*\\.pdf")[[1]]
  system(paste0("cmd /c start ",wkdir,pdfName))
  unlink(wkdir,recursive=TRUE)
})

test_that("pdf is generated using pdfGenerate", {
  local_edition(3)
  skip_on_cran()
  wkdir = paste0(tempdir(),"/testpdf2/")
  workingDirectoryPopulate(wkdir)
  expect_snapshot(pdfGenerate(workDir = wkdir))
  skip_on_os("mac")
  skip_on_os("linux")
  skip_on_os("solaris")
  pdfName = list.files(wkdir,pattern=".*\\.pdf")[[1]]
  system(paste0("cmd /c start ",wkdir,pdfName))
  unlink(wkdir,recursive=TRUE)
})

