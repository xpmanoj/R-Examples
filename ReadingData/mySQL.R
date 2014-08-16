#Connecting and listing databases (eg. Human Genome)
ucscDb <- dbConnect(MySQL(),user="genome", 
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

#Connecting to a DB (hg19) and listing tables
hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                  host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)

# List first 5 tables
allTables[1:5]

#Get dimensions of a specific table
dbListFields(hg19,"affyU133Plus2")
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

# Read from the table
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

#Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)

# Fetch only 10 rows
affyMisSmall <- fetch(query,n=10); dbClearResult(query);
# Get dimensions
dim(affyMisSmall)

# Disconnect once data is extracted
dbDisconnect(hg19)

# Further resources
http://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
http://www.pantz.org/software/mysql/mysqlcommands.html
http://www.r-bloggers.com/mysql-and-r/