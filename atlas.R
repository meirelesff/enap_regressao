# ---
# PEGA E LIMPA DADOS DO ATLAS
# ---


# Pacotes
library(tidyverse)
library(readxl)


# Abre o arquivo
atlas <- read_excel("atlas2013_dadosbrutos_pt.xlsx", sheet = 2)


# Limpa os dados
atlas <- atlas %>%
  setNames(
    
    names(.) %>% 
      iconv(from = "UTF-8", to = "ASCII//TRANSLIT") %>% 
      tolower) %>%
  filter(ano == 2010) %>%
  select(ano, uf, municipio, codmun7, pop, homemtot, mulhertot, gini, pind, rdpc, t_agua, idhm, espvida:mort5, e_anosestudo, agua_esgoto, t_luz, t_lixo, t_env)


# Salva
write_csv(atlas, "atlas_condensado.csv")





