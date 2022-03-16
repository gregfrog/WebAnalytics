# pdf is generated from sample data

    Code
      system(paste0("cmd /c cd ", wkdir, "& dir& powershell -f makerpt.ps1 sample"))
    Output
      [1] 0

# pdf is generated using pdfGenerate

    Code
      pdfGenerate(workDir = wkdir)
    Message <simpleMessage>
      Config Variables Set
      config.author Greg Hunt
      config.baseline.columnList MSTimestamp             
      ignored: s-ip           
      httpop                  
      url                     
      ignored: cs-uri-query   
      ignored: s-port         
      ignored: cs-username    
      userip                  
      useragent               
      ignored: cs(Referer)    
      httpcode                
      ignored: sc-substatus   
      ignored: sc-win32-status
      elapsedms               
      config.baseline.dataDir C:/Users/greg/OneDrive/Documents/R/win-library/4.1/WebAnalytics/extdata
      config.baseline.dirNames .
      config.current.columnList MSTimestamp             
      ignored: s-ip           
      httpop                  
      url                     
      ignored: cs-uri-query   
      ignored: s-port         
      ignored: cs-username    
      userip                  
      useragent               
      ignored: cs(Referer)    
      httpcode                
      ignored: sc-substatus   
      ignored: sc-win32-status
      elapsedms               
      config.current.dataDir C:/Users/greg/OneDrive/Documents/R/win-library/4.1/WebAnalytics/extdata
      config.current.dirNames .
      config.documentName Subproject/Issue
      config.fix.data function (b) 
      {
          if (length(grep("Apache", config.current.columnList)) > 0) {
              b$url = sub("([^?]*)[?].*", "\\1", b$url)
              b$url = sub("[^ ]* ([^ ]*).*", "\\1", b$url)
          }
          b$url = sub("/content/.*", "Static Content Requests", b$url)
          b$url = sub("/Content/.*", "Static Content Requests", b$url)
          b$url = sub("/Scripts/.*", "Static Content Requests", b$url)
          b$url = sub("/bundles/.*", "Static Content Requests", b$url)
          b$url = sub("[0-9]+$", "NNNN", b$url)
          b$url = sub(".*\\.js$", "Static Content Requests", b$url)
          b$url = sub(".*\\.gif$", "Static Content Requests", b$url)
          b$url = sub(".*\\.css$", "Static Content Requests", b$url)
          b$url = sub(".*\\.jpg$", "Static Content Requests", b$url)
          b$url = sub(".*\\.png$", "Static Content Requests", b$url)
          b$url = sub(".*\\.ico$", "Static Content Requests", b$url)
          b$url = sub(".*\\.wsdl$", "Static Content Requests", b$url)
          b$url = sub(".*\\.xsd$", "Static Content Requests", b$url)
          b$url = sub(".*\\.bmp$", "Static Content Requests", b$url)
          b$url = sub(".*\\.html$", "Static Content Requests", b$url)
          b$url = sub(".*dynaTraceMonitor.*", "Monitoring", b$url)
          return(b)
      }
      config.generateDiagnosticPlots TRUE
      config.generateGraphForTimeOver 1000
      config.generatePercentileRankings TRUE
      config.generateServerSessionStats TRUE
      config.generateTransactionDetails TRUE
      config.projectName Client/Project
      config.readBaseline TRUE
      config.securityClass Commercial-In-Confidence
      config.useragent.discardOther TRUE
      config.useragent.generateFrequencies TRUE
      config.useragent.maximumPercentile 96
      config.useragent.minimumPercentage 2
    Warning <simpleWarning>
      40 y values <= 0 omitted from logarithmic plot
    Warning <rlang_warning>
      Removed 2 rows containing missing values (geom_bar).
      Removed 2 rows containing missing values (geom_bar).
      Removed 2 rows containing missing values (geom_bar).
    Warning <simpleWarning>
      37 y values <= 0 omitted from logarithmic plot
    Warning <rlang_warning>
      Removed 2 rows containing missing values (geom_bar).
      Removed 2 rows containing missing values (geom_bar).
    Warning <simpleWarning>
      no non-missing arguments to max; returning -Inf
    Output
      [1] "WebAnalytics20220316144621.pdf"

