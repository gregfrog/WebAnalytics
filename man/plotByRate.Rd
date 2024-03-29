\name{plotByRate}
\alias{plotByRate}
\title{Generates a plot that compares how percentile values in a metric of interest vary as an underlying rate metric changes.  }
\description{
Data is supplied as separate columns for time, data, base rate, 
}
\usage{
plotByRate(timecol, 
      datacol, 
      baseratecol, 
      percentile, 
      breaksString, 
      baseratetimes = timecol, 
      xlab = "Rate", 
      ylab="Variation from overall 95th percentile", 
      title="", 
      baseTimeCol = NULL, 
      baseDataCol=NULL, 
      baseBaseRateCol = NULL, 
      outlierPercentile=NULL) 
}
\arguments{
  \item{timecol}{
	the timestamps for the data column 
	}
  \item{datacol}{
	the data to be compared with the rate column (y axis)
	}
  \item{baseratecol}{
	the underlying rate (x axis on the plot), as a list of counts (setting a dataframe column to 1 works for a web server log dataframe).  The rate is calculated over the \code{breaksString} interval, meaning that if you want to aggregate over a ten minute interval and report an indicative per-second rate the counts in this column must be scaled by dividing them by 600, the number of seconds in ten minutes.  
	}
  \item{percentile}{
	the percentile value that the values are calculated at, the percentiles are calculated for each \code{breaksString} interval and converted to differences from the value of the percentile calculated over the whole period.   
	}
  \item{breaksString}{
	the time interval used for calculation of percentile values, it is supplied to the \code{\link[base:cut]{cut}} function to group the data values.
	}
  \item{baseratetimes}{
	the timestamps for the base data if they are not the same as the timestamps for the data column (defaults to the data column timestamps).  The two sets of timestamps must correspond in some way and the extent to which they do not align must be accounted for in the breaks interval, for example a few seconds or minutes difference would not be an issue for an aggregation interval of an hour, but would be a problem if aggregation is being done by minute or second
	}
  \item{xlab}{
  label for the rate metric
	}
  \item{ylab}{
  label for the data metric
	}
  \item{title}{
  the plot title	
  }
  \item{baseTimeCol}{
  Use this parameteter and the associated \code{baseDataCol} as an alternative time base and data to summarise the data.
	} 
  \item{baseDataCol}{
  Data values associated with the rate column above.  
	}
  \item{baseBaseRateCol}{
  Rate column for the prevoious two columns.   
	}
  \item{outlierPercentile}{
  discard data above this percentile
	}
}
\value{
Returns an R base graphics plot.  This function is intended to be wrapped in a call to \code{\link{plotSave}}
}
\author{
Greg Hunt <greg@firmansyah.com>
}
\examples{
\dontshow{
datd = paste0(tempdir(),"/minconfigtemp")
unlink(datd)
dir.create(paste0(tempdir(),"/minconfigtemp"))
logfile = paste0(datd,"/log.log")
fileConn = gzfile(system.file("extdata", "compressed.log", package = "WebAnalytics"))
writeLines(readLines(fileConn,n=100),con=logfile)
close(fileConn)
# set the files directory name suitable for an R example
configVariableSet("config.workdir", tempdir())
setDTthreads(threads = 1)
}

logFileName = logFileNamesGetLast(dataDirectory=datd, 
  directoryNames=c(".", "."), 
  fileNamePattern="*[.]log")[[1]]

cols = logFileFieldsGetIIS(logFileName)

logdf = logFileRead(logFileName, columnList=cols, 
            logTimeZone = "", timeFormat = "")
           
logdf$numrequestsinthisrecord = 1

plotByRate(logdf$ts, 
      logdf$elapsed, 
      logdf$numrequestsinthisrecord, 
      0.95, 
      "10 mins", 
      xlab="request rate (10 minutes)",
      ylab="variance from overall 95th percentile response time (milliseconds)")

}
\seealso{
\code{\link[base:cut]{cut}}
}
\keyword{ manip }
