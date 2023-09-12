# Hospital Ranking Project

## Overview

This project aims to analyze hospital performance and ranking based on various healthcare outcome measures, such as 30-day mortality rates for different medical conditions (heart attack, heart failure, and pneumonia). It includes R scripts for data analysis and a set of functions for finding and ranking hospitals within a state or across states.

## Contents

- [Project Files](#project-files)
- [Usage](#usage)
- [Function Descriptions](#function-descriptions)
- [How to Run the Code](#how-to-run-the-code)
- [Contributing](#contributing)
- [License](#license)

## Project Files

The project includes the following main components:

- `hospital_ranking.R`: R script containing functions for ranking hospitals within a state and across states based on specified outcome measures.
- `outcome-of-care-measures.csv`: CSV data file containing healthcare outcome measures for different hospitals.

## Usage

This project provides functions for:

1. Finding the best or worst hospitals in a specific state for a given outcome measure.
2. Ranking hospitals across states based on outcome measures.

## Function Descriptions

### `best(state, outcome)`

- This function finds the best hospital in a specified state for a given outcome measure.
- Arguments:
  - `state`: The 2-character abbreviated name of the state.
  - `outcome`: The name of the outcome measure (e.g., "heart attack," "heart failure," or "pneumonia").

### `rankhospital(state, outcome, num)`

- This function ranks hospitals within a state based on a specified outcome measure and rank (best, worst, or a specific rank).
- Arguments:
  - `state`: The 2-character abbreviated name of the state.
  - `outcome`: The name of the outcome measure (e.g., "heart attack," "heart failure," or "pneumonia").
  - `num`: The rank you want to retrieve ("best," "worst," or a specific numeric rank).

### `rankall(outcome, num)`

- This function ranks hospitals across states based on a specified outcome measure and rank (best, worst, or a specific rank).
- Arguments:
  - `outcome`: The name of the outcome measure (e.g., "heart attack," "heart failure," or "pneumonia").
  - `num`: The rank you want to retrieve ("best," "worst," or a specific numeric rank).

## How to Run the Code

To run the code and use the provided functions, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have R installed.
3. Install any required R packages (e.g., `tidyverse`) if not already installed.
4. Run the R scripts to load and analyze the hospital outcome data and perform hospital rankings.

## Contributing

Contributions to this project are welcome! If you have ideas for improvements, bug fixes, or new features, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
