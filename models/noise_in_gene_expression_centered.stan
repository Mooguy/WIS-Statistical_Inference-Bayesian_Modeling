data {
  int<lower=1> N;                
  array[N] int index_1;   
  vector[N] cfp;          
  vector[N] yfp;          
}

parameters {
  real<lower=0> theta;
  real<lower=0> tau;
  vector[N] theta1;       
  real<lower=0> r;   
  real<lower=0> sigma;
}

model {
    theta ~ normal(0, 5000);
    sigma ~ normal(0, 5000);
    tau ~ normal(0, 5000);
    r ~ normal(0, 10);

    theta1 ~ normal(theta, tau); 

    for (n in 1:N) {
      cfp[n] ~ normal(theta1[index_1[n]], sigma);
      yfp[n] ~ normal(r * theta1[index_1[n]], r * sigma);
    }
}


