# Econometrics
Linear regression models find several uses in real-life problems. For example, a Central Bank wanting to identify factors that can affect the Inflation can run a linear regression to find out which factors are important. In econometrics, Ordinary Least Squares (OLS) method is widely used to estimate the parameter of a linear regression model. OLS estimators minimize the sum of the squared errors (a difference between observed values and predicted values)
- Assumptions of OLS Regression
The necessary OLS assumptions, which are used to derive the OLS estimators in linear regression models, are discussed below:

A1. The linear regression model is “linear in parameters.”

A2. There is a random sampling of observations.

A3. The conditional mean should be zero.

A4. There is no multi-collinearity (or perfect collinearity).

A5. Spherical errors: There is homoscedasticity and no autocorrelation

A6: Optional Assumption: Error terms should be normally distributed.

- A1) The linear regression model is “linear in parameters.”
When the dependent variable (Y)(Y) is a linear function of independent variables (X's)(X′s) and the error term, the regression is linear in parameters and not necessarily linear in X'sX ′s.

- A2) There is a random sampling of observations.

The sample taken for the linear regression model must be drawn randomly from the population. For example, if you have to run a regression model to study the factors that impact the scores of students in the final exam, then you must select students randomly from the university during your data collection process, rather than adopting a convenient sampling procedure.
The number of observations taken in the sample for making the linear regression model should be greater than the number of parameters to be estimated. If a number of parameters to be estimated (unknowns) are more than the number of observations, then estimation is not possible. If a number of parameters to be estimated (unknowns) equal the number of observations, then OLS is not required. You can simply use algebra.
The X'sX ′s should be fixed (e. independent variables should impact dependent variables). It should not be the case that dependent variables impact independent variables. This is because, in regression models, the causal relationship is studied and there is not a correlation between the two variables. For example, if you run the regression with inflation as your dependent variable and unemployment as the independent variable, the OLS estimators are likely to be incorrect because with inflation and unemployment, we expect correlation rather than a causal relationship.
The error terms are random. This makes the dependent variable random.

- A3) The conditional mean should be zero.

The expected value of the mean of the error terms of OLS regression should be zero given the values of independent variables.


In other words, the distribution of error terms has zero mean and doesn’t depend on the independent variables X'sX ′s. Thus, there must be no relationship between the X'sX′s and the error term.

- A4) There is no multi-collinearity (or perfect collinearity).

In a simple linear regression model, there is only one independent variable and hence, by default, this assumption will hold true. However, in the case of multiple linear regression models, there are more than one independent variable. The OLS assumption of no multi-collinearity says that there should be no linear relationship between the independent variables. For example, suppose you spend your 24 hours in a day on three things – sleeping, studying, or playing. Now, if you run a regression with dependent variable as exam score/performance and independent variables as time spent sleeping, time spent studying, and time spent playing, then this assumption will not hold.

- A5) Spherical errors: There is homoscedasticity and no autocorrelation.

According to this OLS assumption, the error terms in the regression should all have the same variance.
If this variance is not constant (i.e. dependent on X’s), then the linear regression model has heteroscedastic errors and likely to give incorrect estimates.
This OLS assumption of no autocorrelation says that the error terms of different observations should not be correlated with each other.

-A6) Optional Assumption: Error terms should be normally distributed.

This assumption states that the errors are normally distributed, conditional upon the independent variables. This OLS assumption is not required for the validity of OLS method; however, it becomes important when one needs to define some additional finite-sample properties. Note that only the error terms need to be normally distributed. The dependent variable Y need not be normally distributed.

