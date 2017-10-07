
# MAIN Data Cleaning STARTS ####
# Below program is used for data Cleaning So Do Not run this again
# cleaned Data is written in PwdSet.csv file

pass=read.csv("passwords.csv",header=FALSE,sep=';',col.names = c('password'),stringsAsFactors = FALSE)

pwdLen=c()
flag=1
for(i in pass$password){
  pwdLen[flag]=nchar(i)
  flag=flag+1
}
pass=cbind(pass,pwdLen)
pass=subset(pass,pass$pwdLen<30)

pass=subset(pass,pass$pwdLen<30)

# cleaned data writing in file
write.csv(pass$password,"PwdSet.csv",quote = FALSE,row.names = FALSE,eol="\n")

rm(list=ls())

##### Main Cleaning End ######################################


###### RUN FROM HERE ########

# Reading all passwords from file
f=read.csv("PwdSet.csv",header=FALSE,sep=';',col.names = c('Pwd'),stringsAsFactors = FALSE)

# Sorting Passwords
Pwd=c(sort(f$Pwd))

#### Data Cleaning ####
# Removing Blank Password
Pwd=Pwd[!Pwd==""]
pass=data.frame(Pwd,stringsAsFactors = FALSE)
View(pass)

# Password Frequency calculation Starts
lastpwd=''
count=0
t=1
password=c()
freq=c()
f=TRUE
for(i in pass$Pwd){
  if(f){
    lastpwd=i
    f=FALSE
  }
  if(lastpwd==i){
    count=count+1
  }else{
    password[t]=lastpwd
    freq[t]=count
    t=t+1
    lastpwd=i
    count=1
  }
}
pass=data.frame(password,freq,stringsAsFactors = FALSE)
View(pass)
# Password Frequency calculation ends

# Function Definitions for Password Strength checker Starts
pwdStr=function(p){
  if(nchar(p)>=8 & grepl('[[:upper:]]',p) & grepl('[[:lower:]]',p) & grepl('[[:digit:]]',p) & grepl('[[:punct:]]',p)){
    returnValue('Very Strong')
  }else if(nchar(p)>=6 & grepl('[[:alpha:]]',p) & grepl('[[:punct:]]',p) & grepl('[[:digit:]]',p)){
    returnValue('Strong')
  }else if(nchar(p)>=6 & (grepl('[[:alpha:]]',p) & grepl('[[:punct:]]',p) | grepl('[[:alpha:]]',p) & grepl('[[:digit:]]',p) | grepl('[[:punct:]]',p) & grepl('[[:digit:]]',p))){
    returnValue('Medium')
  }else if(nchar(p)>=6 & grepl('[[:alpha:]]',p)){
    returnValue('Week')
  }else{
    returnValue('Too Week')
  }
}
# Function Definitions for Password Strength checker Starts

# START :Calculating Password Strength for Each password
pwdStrength=c()
flag=1
for(i in pass$password){
  pwdStrength[flag]=pwdStr(i)
  flag=flag+1
}
pass=cbind(pass,pwdStrength)
View(pass)
# END :Calculating Password Strength for Each password

# START :Calculating Password Length for Each password
pwdLen=c()
flag=1
for(i in pass$password){
  pwdLen[flag]=nchar(i)
  flag=flag+1
}
pass=cbind(pass,pwdLen)
# END :Calculating Password Length for Each password

# START : Function Definition for different cases,digits and punct
isUpper <- function(s) {
  return (all(grepl("[[:upper:]]", strsplit(s, "")[[1]])))
}
isLower <- function(s) {
  return (all(grepl("[[:lower:]]", strsplit(s, "")[[1]])))
}
isDigit <- function(s) {
  return (all(grepl("[[:digit:]]", strsplit(s, "")[[1]])))
}
isPunct <- function(s) {
  return (all(grepl("[[:punct:]]", strsplit(s, "")[[1]])))
}

# END : Function Definition for different cases,digits and punct

################################################################################################################
totalPwd=length(Pwd)

#Percentage of Passwords having only lower case letters
count=0
for(p in Pwd){
  if(isLower(p)){
    count=count+1
  }
}
r1=(count/totalPwd)*100
cat("Percentage of Passwords having only lower case letters: ",r1)

#Percentage of Passwords having only Upper case letters
count=0
for(p in Pwd){
  if(isUpper(p)){
    count=count+1
  }
}
r2=(count/totalPwd)*100
cat("Percentage of Passwords having only Upper case letters: ",r2)

#Percentage of Passwords having only digits
count=0
for(p in Pwd){
  if(isDigit(p)){
    count=count+1
  }
}
r3=(count/totalPwd)*100
cat("Percentage of Passwords having only digits: ",r3)

#Percentage of Passwords having only Special Symbols 
count=0
for(p in Pwd){
  if(isPunct(p)){
    count=count+1
  }
}
r4=(count/totalPwd)*100
cat("Percentage of Passwords having only Special Symbols : ",r4)

#Percentage of Passwords having only Numbers and Special Symbols 
count=0
for(p in Pwd){
  if(grepl('[[:digit:]]',p) & grepl('[[:punct:]]',p)){
    count=count+1
  }
}
r5=(count/totalPwd)*100
cat("Percentage of Passwords having only Numbers and Special Symbols : ",r5)

#Percentage of Passwords having length less than 8 characters
count=0
for(p in Pwd){
  if(nchar(p)<8){
    count=count+1
  }
}
r6=(count/totalPwd)*100
cat("Percentage of Passwords having length less than 8 characters : ",r6)

#Percentage of Passwords having only Combination of Upper case and Lower case.
count=0
for(p in Pwd){
  if(grepl('[[:upper:]]',p) & grepl('[[:lower:]]',p)){
    count=count+1
  }
}
r7=(count/totalPwd)*100
cat("Percentage of Passwords having only Combination of Upper case and Lower case. : ",r7)

#Percentage of Passwords having only Combination of Upper case and Digits.
count=0
for(p in Pwd){
  if(grepl('[[:upper:]]',p) & grepl('[[:digit:]]',p)){
    count=count+1
  }
}
r8=(count/totalPwd)*100
cat("Percentage of Passwords having only Combination of Upper case and Digits. : ",r8)

#Percentage of Passwords having only Combination of Upper case and Special Symbols.
count=0
for(p in Pwd){
  if(grepl('[[:upper:]]',p) & grepl('[[:punct:]]',p)){
    count=count+1
  }
}
r9=(count/totalPwd)*100
cat("Percentage of Passwords having only Combination of Upper case and Special Symbols. : ",r9)

#Percentage of Passwords having only Combination of Lower case and Digits.
count=0
for(p in Pwd){
  if(grepl('[[:lower:]]',p) & grepl('[[:digit:]]',p)){
    count=count+1
  }
}
r10=(count/totalPwd)*100
cat("Percentage of Passwords having only Combination of Lower case and Digits. : ",r10)

#Percentage of Passwords having only Combination of Lower case and Special Symbols.
count=0
for(p in Pwd){
  if(grepl('[[:lower:]]',p) & grepl('[[:punct:]]',p)){
    count=count+1
  }
}
r11=(count/totalPwd)*100
cat("Percentage of Passwords having only Combination of Lower case and Special Symbols. : ",r11)

####################################
# All results at on place
cat("Percentage of Passwords having only lower case letters: ",r1)
cat("Percentage of Passwords having only Upper case letters: ",r2)
cat("Percentage of Passwords having only digits: ",r3)
cat("Percentage of Passwords having only Special Symbols : ",r4)
cat("Percentage of Passwords having only Numbers and Special Symbols : ",r5)
cat("Percentage of Passwords having length less than 8 characters : ",r6)
cat("Percentage of Passwords having only Combination of Upper case and Lower case. : ",r7)
cat("Percentage of Passwords having only Combination of Upper case and Digits. : ",r8)
cat("Percentage of Passwords having only Combination of Upper case and Special Symbols. : ",r9)
cat("Percentage of Passwords having only Combination of Lower case and Digits. : ",r10)
cat("Percentage of Passwords having only Combination of Lower case and Special Symbols. : ",r11)

# Data for Pie chart
pieData=c(r1,r2,r3,r4,r5,r7,r8,r9,r10,r11)
level=c('Lower Case','Upper case','Digits','Special Symbol','Digits & Special Sym','Ucase & Lcase','Ucase & Digits','Ucase and Special Sym','Lcase and Digits','Lcase and Special Sym')

# Plot the chart.
pie(pieData,level,main="Analysis of Password")

#Password Length Analysis
plot(pass$pwdLen,type="h",ylab="Password Length",xlab = "Frequency",main="Password length Analysis")

#Password Strength analysis
plot(pass$pwdStrength,xlab="Password Strenght",ylab = "Frequency",main="Password Strength Analysis")

# Password Frequency Analysis
# Following will show the Passwords in decreasing order of frequency
sortByFreq=pass[order(pass$freq),]
sortByFreq=sortByFreq[order(sortByFreq$freq,decreasing = TRUE),]
View(sortByFreq)
