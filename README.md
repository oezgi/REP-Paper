# Reproducibility and Replicability Project : COVID and Home Advantage in Football

## Introduction

Briefly introduce the subject of the study, the problem it addresses, and the key results or insights obtained from the reproduction and replication effort.

## Reproducibility

### How to Reproduce the Results
1. **Requirements**  
   - List dependencies and their versions (e.g., Python, R, libraries, etc.).
   - Specify any system requirements.

2. **Setting Up the Environment**  
   - Provide instructions for using the Dockerfile to create a reproducible environment:  
     ```bash
     docker build -t reproducible-project .
     docker run -it reproducible-project
     ```

3. **Reproducing Results**  
   - Describe how to run the automated scripts or notebooks to reproduce data and analyze results:
     ```bash
     bash scripts/run_analysis.sh
     ```
   - Mention Jupyter notebooks (if applicable):  
     Open `notebooks/reproduce_results.ipynb` to execute the analysis step-by-step.

4. **Automation (Bonus)**  
   - Explain the included GitHub Action that produces or analyzes data automatically.  
    
### Encountered Issues and Improvements
- Report any challenges, errors, or deviations from the original study.
- In Wilcoxon and MannWhitneyU, instead of using "two-sided", in the original study, "less" was used. Different results in p-value because of the version of sciPy used.

### Is the Original Study Reproducible?
- Summarize the success or failure of reproducing the study.
- Include supporting evidence, such as comparison tables, plots, or metrics.

## Replicability

### Variability Factors
- **List of Factors**: Identify all potential sources of variability (e.g., dataset splits, random seeds, hardware).  
  Example table:
  | Variability Factor | Possible Values     | Relevance                                   |
  |--------------------|---------------------|--------------------------------------------|
  | EXAMPLE Random Seed        | [0, 42, 123]       | Impacts consistency of random processes    |
  | Statistical Tests for Assessing Differences Between Home and Away Matches | | Alternative tests provide a broader view of the data’s characteristics which may affect the conclusions. |

- **Constraints Across Factors**:  
  - Document any constraints or interdependencies among variability factors.  
    For example:
    - Random Seed must align with dataset splits for consistent results.
    - Hardware constraints may limit the choice of GPU-based factors.

- **Exploring Variability Factors via CLI (Bonus)**  
   - Provide instructions to use the command-line interface (CLI) to explore variability factors and their combinations:  
     ```bash
     python explore_variability.py --random-seed 42 --hardware GPU --dataset-version v1.1
     ```
   - Describe the functionality and parameters of the CLI:
     - `--random-seed`: Specify the random seed to use.
     - `--hardware`: Choose between CPU or GPU.
     - `--dataset-version`: Select the dataset version.


### Replication Execution
1. **Instructions**  
   - Provide detailed steps or commands for running the replication(s):  
     ```bash
     bash scripts/replicate_experiment.sh
     ```

2. **Presentation and Analysis of Results**  
   - **Changing Statistical Tests for Assessing Differences Between Home and Away Matches:**
   In the given scenario, the Wilcoxon Signed-Rank test was used because it is a non-parametric test, ideal for situations where data may not follow a normal distribution. For the use of p-values, they quantified the evidence against the null hypothesis (e.g., no difference between home and away performance) and small p-values (e.g., <0.05) indicated statistically significant differences, suggesting that observed results are unlikely due to random chance.

### Does It Confirm the Original Study?
- Summarize the extent to which the replication supports the original study’s conclusions.
- Highlight similarities and differences, if any.

## Conclusion
- Recap findings from the reproducibility and replicability sections.
- Discuss limitations of your
