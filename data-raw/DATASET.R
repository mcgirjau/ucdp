library(dplyr)

# remove variables that are included for backwards or cross-dataset compatibility
vars_to_remove <- c("relid", "code_status", "conflict_dset_id", "dyad_dset_id", "side_a_dset_id",
                    "side_b_dset_id", "geom_wkt", "priogrid_gid", "country_id", "gwnoa", "gwnob")

GED <- tryCatch({
  unzip("ged201-csv.zip") %>%
    readr::read_csv(col_types = readr::cols()) %>%
    select(-all_of(vars_to_remove)) %>%
    as_tibble()
}, finally = file.remove("ged201.csv"))

usethis::use_data(GED, overwrite = TRUE)
