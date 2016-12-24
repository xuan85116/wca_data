wca_files <- list.files("WCA_export")
wca_files <- wca_files[wca_files != "README.txt"]
wca_files <- wca_files[wca_files != "WCA_export_Results.tsv"]
wca_files <- wca_files[wca_files != "WCA_export_Scrambles.tsv"]
wca_files <- wca_files[wca_files != "WCA_export_Rounds.tsv"]
# wca_files <- wca_files[wca_files != "WCA_export_Events.tsv"]

for (i in wca_files){
  print(i)
  assign(gsub("\\.tsv","",i),read.table(paste0("WCA_export/",i),sep = "\t",header = T,fill = T,encoding = "UTF-8",quote=""))
}

##add name and country
WCA_export_RanksAverage$countryId <- WCA_export_Persons$countryId[match(WCA_export_RanksAverage$personId, WCA_export_Persons$id)]
WCA_export_RanksSingle$countryId <- WCA_export_Persons$countryId[match(WCA_export_RanksSingle$personId, WCA_export_Persons$id)]

WCA_export_RanksAverage$name <- WCA_export_Persons$name[match(WCA_export_RanksAverage$personId, WCA_export_Persons$id)]
WCA_export_RanksSingle$name <- WCA_export_Persons$name[match(WCA_export_RanksSingle$personId, WCA_export_Persons$id)]

##count best

WCA_export_RanksAverage$best <- WCA_export_RanksAverage$best/100
WCA_export_RanksSingle$best <- WCA_export_RanksSingle$best/100