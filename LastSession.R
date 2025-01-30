# Data Manipulation und Wrangling
library(dplyr)        # Datenmanipulation, Verwandlung und Summarization
library(tidyverse)    # Sammlung von Paketen für Datenmanipulation und Visualisierung (inkl. dplyr, ggplot2, etc.)
library(magrittr)     # Pipe-Operator (%>%) für die Verkettung von Funktionen
library(tibble)       # Erstellen von Data Frames als tibble (eine modernisierte Form von Data Frames)

# Machine Learning und Modellierung
library(caret)        # Hauptbibliothek für maschinelles Lernen in R (Modelltraining, Cross-Validation, etc.)
library(parsnip)      # Einfacher Zugriff auf Modelle, ohne sich um die spezifische Modellimplementation zu kümmern
library(workflows)    # Modell-Workflows zur Strukturierung von Prozessen (Modell + Rezept + Daten)
library(tune)         # Hyperparameter-Tuning (z.B. Grid Search)
library(ranger)       # Random Forest (insbesondere Random Forest mit schnellen Berechnungen)
library(xgboost)      # XGBoost: Leistungsstarke Gradient Boosting Machine für strukturierte Daten
library(randomForest) # Alternativ für Random Forest (klassische Implementierung)
library(rsample)      # Datensplitting und Resampling-Techniken (z.B. Trainings-/Testset teilen)

# Modellierung (Zusatz)
library(tidymodels)   # Sammlung von Paketen für maschinelles Lernen mit tidyeigenen Prinzipien
library(dials)        # Hyperparameter-Tuning-Tools, um Hyperparameter-Bereiche festzulegen
library(tuneRanger)   # Hyperparameter-Tuning für Ranger (Random Forest-Implementierung)

# Explorative Datenanalyse (EDA) und Visualisierung
library(ggplot2)      # Visualisierung (Grafiken und Diagramme)
library(correlationfunnel) # Korrelationsermittlung und Visualisierung
library(skimr)        # Überblick und Zusammenfassung der Daten
library(DataExplorer) # Automatisierte Explorative Datenanalyse (EDA)

# Imputation und Fehlwertbehandlung
library(mice)         # Multiple Imputation von fehlenden Werten

# Daten Einlesen und Verarbeitung
library(readr)        # Schnelles Einlesen von Daten (z.B. CSV, TSV)

# Zeitmessung
library(tictoc)       # Zeitmessung (Timing von Code-Ausführungen)



Versicherung <- read_csv("Versicherung.csv")

plit_missing(data)



