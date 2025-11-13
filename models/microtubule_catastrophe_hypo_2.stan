functions {
  // log-PDF for hypoexponential with 2 rates
  real hypoexp2_lpdf(real x, real beta_1, real beta_2) {
    if (beta_1 == beta_2) {
      return 2 * log(beta_1) + log(x) - beta_1 * x;
    } else {
      real diff = beta_2 - beta_1;
      real pdf = (beta_1 * beta_2 / diff) * (exp(-beta_1 * x) - exp(-beta_2 * x));
      return log(pdf);
    }
  }

  real hypoexp2_rng(real beta_1, real beta_2) {
    return exponential_rng(beta_1) + exponential_rng(beta_2);
  }
}

data {
  int<lower=1> N;
  vector[N] y;
}

parameters {
  real log_beta1;
  real log_beta2;
}

transformed parameters {
  real<lower=0> beta_1 = exp(log_beta1);
  real<lower=0> beta_2 = exp(log_beta2);
}

model {
  log_beta1 ~ normal(0, 5);
  log_beta2 ~ normal(0, 5);

  // likelihood
  for (n in 1:N)
    target += hypoexp2_lpdf(y[n] | beta_1, beta_2);
}

generated quantities {
  vector[N] y_rep;
  vector[N] log_lik;

  for (n in 1:N)
    y_rep[n] = hypoexp2_rng(beta_1, beta_2);

  for (n in 1:N)
    log_lik[n] = hypoexp2_lpdf(y[n] | beta_1, beta_2);
}
