# GUIDA PER LA CORRETTA CREAZIONE E POPOLAMENTO DEL DATABASE

# FORTEMENTE CONSIGLIATO L'UTILIZZO DEL SOFTWARE: pgAdmin4
# TALE GUIDA SUPPONE CHE SI ABBIA A DISPOSIZIONE IL SOFTWARE pgAdmin4


########################################################################
# METODO VELOCE - CONSIGLIATO
########################################################################

# PASSO 1
# Aprire pgAdmin4 e andare nel Query tool
# Copiare il contenuto del file 00_create_database.sql ed eseguire (conenuto nella cartella 03_FAST_CREATE_AND_INSERT).
# In questo modo verra creato il DataBase denominato fpdb.

# PASSO 2
# Una volta creato il DataBase fpdb spostarsi nel database ed andare nel Query tool
# Copiare il contenuto del file 01_create_insert_all.sql ed eseguire (conenuto nella cartella 03_FAST_CREATE_AND_INSERT).

########################################################################


########################################################################
# METODO LENTO - NON CONSIGLIATO
########################################################################

# PASSO 1
# Aprire pgAdmin4 e andare nel Query tool
# Copiare il contenuto del file 00_create_database.sql ed eseguire (conenuto nella cartella 01_CREATE).
# In questo modo verra creato il DataBase denominato fpdb.

# PASSO 2
# Prima fase schema.
# Una volta creato il DataBase fpdb spostarsi nel database ed andare nel Query tool
# In sequenza (RISPETTARE LA SEQUENZA) copiare ed eseguire il contenuto dei files (conenuti nella cartella 01_CREATE):
# 01_create_schema.sql
# 02_create_domain.sql
# 03_create_type.sql
# 04_create_pre_function.sql
# 05_create_table_constraint.sql
# 06_create_post_function.sql
# 07_create_trigger_function.sql
# 08_create_trigger.sql
# 09_trigger_before_insert.sql

# PASSO 3
# Prima fase di popolamento.
# Andare nel Query tool del Database fpdb.
# In sequenza (RISPETTARE LA SEQUENZA) copiare ed eseguire il contenuto dei files (conenuti nella cartella 02_INSERT):
# 01_insert_country.sql
# 02_insert_confederation.sql
# 03_insert_competition.sql
# 04_insert_position.sql
# 05_insert_trophy.sql
# 06_insert_prize.sql
# 07_insert_tag.sql


# PASSO 4
# Seconda fase schema.
# Andare nel Query tool del Database fpdb.
# In sequenza (RISPETTARE LA SEQUENZA) copiare ed eseguire il contenuto dei files (conenuti nella cartella 01_CREATE):
# 10_trigger_after_insert.sql
# OPZIONALI MA CONSIGLIATI (NECESSARI PER L'INTEGRAZIONE CON L'APPLICATIVO JAVA)
# 11_views.sql
# 12_JAVA_function.sql

# PASSO 5
# Seconda fase di popolamento.
# Andare nel Query tool del Database fpdb.
# In sequenza (RISPETTARE LA SEQUENZA) copiare ed eseguire il contenuto dei files (conenuti nella cartella 02_INSERT):
# 08_insert_team.sql
# 09_insert_player.sql
# 10_insert_militancy.sql
# 11_insert_competition_edition.sql
# 12_insert_partecipation.sql
# 13_insert_trophy_case.sql
# 14_insert_player_position.sql
# 15_insert_admin.sql

########################################################################
