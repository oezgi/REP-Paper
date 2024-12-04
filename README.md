# Reproducibility and Replicability Project : COVID and Home Advantage in Football
Ezgi OZEL - Alp JAKOP  
5INFO

## Introduction

This analysis focuses on exploring the concept of home advantage in football and how it was impacted during the COVID-19 pandemic. Home advantage has long been a significant topic in sports science, with research attributing it to factors such as crowd support, travel fatigue, and referee bias. The COVID-19 pandemic provided a unique natural experiment, as matches were played in empty stadiums during 2019–2021, removing the influence of crowds.

By combining reproducibility with replication and introducing variability factors, this project not only validates the original findings but also extends their scope to new contexts. The results provide valuable insights into the dynamics of home advantage, offering a deeper understanding of how external factors like crowd absence can alter the competitive balance in football.

## How to Reproduce and Replicate

1. **Requirements**  
  - Docker installed on your machine.
  - Bash shell (Linux/MacOS, or Git Bash on Windows).
  - The environment is managed through Docker to ensure consistent results. The following Python libraries are used (requirements.txt):
    - `pandas`
    - `matplotlib`
    - `jupyter`
    - `nbconvert`
    - `scipy==1.6`
    - `numpy(>=1.16.5, <1.20)`

2. **Reproducing Results and Executing Replication**  
  - Run the `run_notebooks.sh` script to execute the entire workflow:  
    ```bash
    bash run_notebooks.sh
    ```
    The script will:  
    - Build the Docker image and set up the environment.  
    - Execute `Data-Extraction.ipynb`.  
    - Execute `Reproduce.ipynb`.  
    - Convert `Reproduce.ipynb` to HTML.  
    - Execute `Replicate.ipynb`.  
    - Convert `Replicate.ipynb` to HTML.  
    
    HTML outputs will be available in the `notebooks` directory.

  - Open `notebooks/Reproduce.ipynb` and `notebooks/Replicate.ipynb` to execute the analysis step-by-step. Don't forget to verify that the versions of the dependencies on your local machine match the ones specified in `requirments.txt` file.

## Reproducibility
    
### Encountered Issues and Improvements
While the results ultimately matched, we faced several challenges due to missing documentation in the original study and differences in our initial computational setup:

1. **Data Extraction Process:** The resource for the data was specified, but the methodology for extracting and processing the data was not detailed. This initially caused discrepancies in data representation during our replication attempt.
2. **Lack of Environmental Specifications:** The study did not specify the versions of software, libraries, or tools used. Differences in versions, particularly SciPy, resulted in variations in p-values and statistical test outputs in our early attempts. The original study employed Wilcoxon and Mann-Whitney U tests with `alternative='less'`, while our initial setup defaulted to `alternative='two-sided'`. This conflict led to doubled p-values and initially misaligned results.

**Adjustments to Match Methodology:** To address these issues, we contacted the original author, who provided clarification on the data extraction process and the computational environment. We subsequently downgraded both SciPy and Python versions to match their setup, allowing us to replicate their statistical configuration. This adjustment ensured comparability in p-value interpretation and consistency with the original methodology.

Despite these numerical differences, the key findings remained consistent: **home advantage significantly diminished during COVID-19 when matches were played without crowds**. This challenge underscored the importance of documenting software versions and methodological details in reproducing studies. It also illustrated the robustness of the original findings, as they held true even when tested with different software configurations.

### Is the Original Study Reproducible?
- Summarize the success or failure of reproducing the study.
- Include supporting evidence, such as comparison tables, plots, or metrics.

The original study is **reproducible**, as our replicated analysis produced identical results once key methodological details were clarified. The study's findings regarding the significant reduction in home advantage during the COVID-19 pandemic were fully confirmed.

The original study analyzed the difference in points gained at home and away across multiple leagues and seasons, highlighting a largely positive home advantage for non-COVID seasons. Four key analyses were performed, which were successfully reproduced in this study with exact results:

**Home vs. Away Points:** Differences between points gained at home and away were assessed. The results consistently showed a significant positive home advantage for all leagues in non-COVID seasons.

<div align="center">
  <img src="analysis-results/home-away-points.png" alt="Home vs. Away Points Results" title="Home vs. Away Points Results" width="200">
</div>


**Evolution of Mean Points per Match:** The mean points gained per match for home and away teams were plotted across seasons from 2014 to 2020, illustrating the steady trend of home advantage and its disruption during COVID seasons.

<div align="center">
  <img src="analysis-results/evolution-mean-points.jpg" alt="Evolution of Mean Points per Match" title="Evolution of Mean Points per Match" width="500">
</div>


**Comparison Across All Leagues and Seasons:** Wilcoxon Signed-Rank tests were applied to assess the differences between home and away matches for points, xPoints, and xG across all leagues and seasons. Effect sizes were calculated using Cohen’s d to quantify the magnitude of these differences. The results consistently demonstrated a significant home advantage in non-COVID seasons.

**Seasonal Comparison Within Each League:** Mann-Whitney U tests were conducted to evaluate differences between seasons for each league. These tests focused on actual results at home and xPoints at home, capturing how home performance varied across seasons and highlighting the impact of the COVID-19 pandemic on home advantage.

The replication successfully reproduced the results of the original study, confirming its findings. These consistent outcomes validate the robustness of the original analysis and demonstrate the reproducibility of its conclusions regarding the impact of the COVID-19 pandemic on home advantage in football.

## Replicability

### Variability Factors
- **List of Factors**: Identify all potential sources of variability (e.g., dataset splits, random seeds, hardware).  
  Example table:
  | Variability Factor | Possible Values     | Relevance                                   |
  |--------------------|---------------------|--------------------------------------------|
  | **Statistical Tests for Assessing Differences Between Home and Away Matches** | [Wilcoxon, Paired t-Test] | Different statistical tests highlight diverse characteristics of the data, impacting p-values and interpretations. |
  | **Data Inclusion:** Post-COVID Data	| [2017–2020, 2017–2023] | Including post-COVID data (2020–2023) assesses whether home advantage returned to pre-COVID levels. |
  | **League Selection:** Champions League | 	[Domestic Leagues, Champions League] | Adding the Champions League introduces better teams, higher stakes, and a broader dataset, testing generalizability. |

- **Constraints Across Factors**:  
  - **Statistical Tests:** Tests like paired t-tests require balanced datasets with equal numbers of home and away matches.
  - **League and Match Context:** Results from one league may not directly translate to another due to differences in formats and competitive environments.

### Presentation and Analysis of Results 
   - **Changing Statistical Tests for Assessing Differences Between Home and Away Matches:**
   In the given scenario, the Wilcoxon Signed-Rank test was used because it is a non-parametric test, ideal for situations where data may not follow a normal distribution. For the use of p-values, they quantified the evidence against the null hypothesis (e.g., no difference between home and away performance) and small p-values (e.g., <0.05) indicated statistically significant differences, suggesting that observed results are unlikely due to random chance.

### Does It Confirm the Original Study?
- Summarize the extent to which the replication supports the original study’s conclusions.
- Highlight similarities and differences, if any.

## Conclusion
- Recap findings from the reproducibility and replicability sections.
- Discuss limitations of your
