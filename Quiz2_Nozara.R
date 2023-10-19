

#Question 1:

#Answer:

#Reading data 
covid <- read.csv(file.choose(), sep=";")


 
#Formatting of variables
#type of x is numeric
typeof(covid$covid$Hospitalization.type)
typeof(covid$Symptoms)
typeof(covid$Outcome)
typeof(covid$Date.of.birth)
typeof(covid$First.day.of.symptoms)
typeof(covid$Date.of.outcome)
typeof(covid$Date.of.diagnosis)
typeof(covid$Epidemiological.link)

# OR we can see as below the structure of the data
str(covid)

# Check the first few rows of the data
head(covid)

#Question 2:

# Convert Hospitalization.type, Symptoms, and Outcome to factors

# make factors

covid$Hospitalization.type <- as.factor(covid$Hospitalization.type)
covid$Symptoms <- as.factor(covid$Symptoms)
covid$Outcome <- as.factor(covid$Outcome)

# Check levels

levels(covid$Hospitalization.type)
levels(covid$Symptoms)
levels(covid$Outcome)


## Convert Epidemiological.link to character

covid$Epidemiological.link <- as.character(covid$Epidemiological.link)
typeof(covid$Epidemiological.link)



#Question 3:

covid$Date.of.diagnosis <- as.Date(covid$Date.of.diagnosis, format = "%Y-%m-%d")
# Ordering the data based on the Date.of.diagnosis column
covid <- covid[order(as.Date(covid$Date.of.diagnosis)), ]
covid
# View the ordered data
head(covid)


#Question 4:


More_Info <- ifelse(covid$Symptoms == "Asymptomatic" & covid$Hospitalization.type == "Home", "Home_Asymptomatic", "Other")

# Create a data frame with the More_Info variable
info_df <- data.frame(More_Info)

# Generate a bar plot for the More_Info variable

# Install and load the ggplot2 package


library(ggplot2)

ggplot(info_df, aes(x = More_Info)) +
  geom_bar(fill = "steelblue") +
  ggtitle("Cases: Home Asymptomatic vs Other") +
  xlab("Case Category") +
  ylab("Count")


#Question 5:

#Counting


# Counting the number of cases using xor

cases <- xor(covid$Date.of.birth > 1981, covid$Outcome == "Healed")
css <- cases & covid$Hospitalization.type == "Home"
sum(css)


#Question 6


# Calculate the age of each patient in years
covid$Age <- as.numeric(difftime(Sys.Date(), covid$Date.of.birth, units = "days"))/365

# View the Age vector
print(covid$Age)


#Question 7

# Create the sequence of integers from 1 to 1000 and name it Maneskin
Maneskin <- seq(1, 1000)
print(Maneskin)

#Question 8

# Define the Maneskin vector
Maneskin <- seq(1, 1000)

# Check which elements in Maneskin are divisible by 3 but not by 7
for (num in Maneskin) {
  if (num %% 3 == 0 & num %% 7 != 0) {
    print(num)
  }
}

#Question 9


# Define the Maneskin vector
Maneskin <- seq(1, 1000)

# Check which elements in Maneskin are divisible by 7 but not by 3

for (num in Maneskin) {
  if (num %% 7 == 0 & num %% 3 != 0) {
    print(num)
  }
}

#Question 10

# Define the Maneskin vector
Maneskin <- seq(1, 1000)

Maneskin <- c(1, 3, 7, 21, 35, 42, 45, 49, 70)

# Loop structure to print the sequence as per the conditions
for (chosen in 1:length(Maneskin)) {
  if (Maneskin[chosen] %% 3 == 0 && Maneskin[chosen] %% 7 == 0) {
    print(Maneskin[chosen])
  } else if (Maneskin[chosen] %% 3 == 0) {
    print("Zitti")
  } else if (Maneskin[chosen] %% 7 == 0) {
    print("Buoni")
  } else {
    print(Maneskin[chosen])
  }
}





#Question 11


#Modifying the elements in the Maneskin vector within the loop would disrupt the original sequence and likely 
#produce unexpected and incorrect results because the loop operates based on the original values, and modifying them 
#would affect the iteration.


#REF: https://chat.openai.com/share/685514d8-1b2f-4646-9b22-f883353ce91d
#REF: https://chat.openai.com/share/198099a7-9678-42ac-abfc-a178986ba462