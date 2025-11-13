data {
  int<lower=1> N;                
  array[N] int index_1;   
  vector[N] cfp;          
  vector[N] yfp;          
}

parameters {
  real<lower=0> theta;
  real<lower=0> tau;
  vector[N] theta1_tilde;
  real<lower=0> r;   
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] theta1 = theta + tau * theta1_tilde;
}

model {
    theta ~ normal(0, 5000);
    sigma ~ normal(0, 5000);
    tau ~ normal(0, 5000);
    r ~ normal(0, 10);

    theta1_tilde ~ std_normal();

    for (n in 1:N) {
      cfp[n] ~ normal(theta1[index_1[n]], sigma);
      yfp[n] ~ normal(r * theta1[index_1[n]], r * sigma);
    }
}

generated quantities {
    // vector[N] log_lik;
    // vector[N] y_rep_cfp;
    // vector[N] y_rep_yfp;
    // for (n in 1:N) {
    //     log_lik[n] = normal_lpdf(cfp[n] | theta_cfp[index_1[n]], sigma) +
    //                  normal_lpdf(yfp[n] | theta_yfp[index_1[n]], sigma);

    //     y_rep_cfp[n] = normal_rng(theta_cfp[index_1[n]], sigma);
    //     y_rep_yfp[n] = normal_rng(theta_yfp[index_1[n]], sigma);
    // }
}


