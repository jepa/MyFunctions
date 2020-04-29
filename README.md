# MyFunctions
Package collecting functions I commonly use. Note all functions start with "my_"

# Useful functions:

- `devtools::document()`, this will automatically create the function documentation
- `devtools::install_github("jepa/MyFunctions")`, run this function to install the package
  -- set `force = TRUE` for updates and restart R

# Functions added
- `my_lib`, loads a selected library and installs those absent
- `my_ggtheme_p()`, a personalized theme for `ggplot2` plots
- `my_ggtheme_m()`, a personalized theme for `ggplot2` maps
- `my_path`, sets different paths for project
  - - requires `data.table`,`readxl`, `stringr`
